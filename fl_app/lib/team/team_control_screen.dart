import 'package:fl_app/matcher/match_model.dart';
import 'package:fl_app/profile/profile_screen.dart';
import 'package:fl_app/repos/user_model.dart';
import 'package:fl_app/team/models/team_user.dart';
import 'package:fl_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class TeamControlScreen extends StatefulWidget {
  const TeamControlScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TeamControlScreenState();
  }
}

class _TeamControlScreenState extends State<TeamControlScreen> {
  final List<UserModel> _users = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Управление командой'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                _buildVerticalMargin(20),
                const SliverToBoxAdapter(
                  child: Text(
                    'МММ "Рога и копыта"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                _buildVerticalMargin(10),
                const SliverToBoxAdapter(
                  child: Text(
                    'Команда топ. Можем запилить все что угодно. Антихайп. Обращайтесь к нам.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                _buildVerticalMargin(40),
                _buildUsersList(),
                _buildVerticalMargin(40),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: MyButton(
                      text: 'Поиск участников',
                      onClick: () async {
                        final matched =
                            await Navigator.of(context).pushNamed('/match');

                        if (matched != null) {
                          final users = matched as List<UserModel>;

                          print('matched count: ${users.length}');

                          if (users.isNotEmpty) {
                            setState(() {
                              _users.clear();
                              _users.addAll(
                                users,
                              );
                            });
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(220),
              ),
              child: const Text('Перейти в чат'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUsersList() {
    if (_users.isNotEmpty) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: _users.length,
          (context, index) => ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(vkId: _users[index].vkId),
                ),
              );
            },
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: NetworkImage(_users[index].photoUrl),
            ),
            title: Text(_users[index].name),
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Icon(
              size: 40,
              Icons.people,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ваша команда пуста.\nВоспользуйтесь поиском.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      );
    }
  }

  Widget _buildVerticalMargin(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}
