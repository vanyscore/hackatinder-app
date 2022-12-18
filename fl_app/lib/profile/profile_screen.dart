import 'package:fl_app/repos/user_model.dart';
import 'package:fl_app/repos/user_repo.dart';
import 'package:fl_app/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_bridge/vk_bridge.dart';

class ProfileScreen extends StatefulWidget {
  final int vkId;

  const ProfileScreen({
    super.key,
    required this.vkId,
  });

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = true;
  UserModel? _userModel;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initProfileInfo();
    });
  }

  void _initProfileInfo() async {
    final repo = Provider.of<UserRepo>(context, listen: false);
    final vkId = (await VKBridge.instance.getUserInfo()).id;
    final user = await repo.getUser(vkId);

    if (user != null) {
      setState(() {
        _userModel = user;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 16),
        alignment: Alignment.topCenter,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _userModel == null
                ? const Center(
                    child: Text('Не удалось загрузить пользователя'),
                  )
                : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(_userModel!.photoUrl),
          radius: 75,
        ),
        const SizedBox(height: 24),
        Text(
          _userModel!.fullName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: const [
            Text(
              "Обо мне",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от всего сердца. Я совсем один и блаженствую в здешнем краю, словно созданном для таких, как я. Я так счастлив, мой друг, так упоен ощущением покоя, что искусство мое страдает от этого.",
        ),
        const SizedBox(height: 16),
        Row(
          children: const [
            Text(
              "Мои навыки",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            runSpacing: 8,
            spacing: 8,
            children: _userModel!.skills.map((e) => Tag(name: e)).toList(),
          ),
        )
      ],
    );
  }
}
