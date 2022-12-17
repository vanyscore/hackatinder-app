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
  final List<TeamUser> _users = [];

  @override
  void initState() {
    super.initState();

    // _users.addAll([
    //   const TeamUser(
    //     imageUrl:
    //         'https://icdn.lenta.ru/images/2021/06/03/14/20210603141543555/square_320_e69d8d78f5a03c281c39be35b26108fc.jpg',
    //     name: 'Хасбулад Ибрагимов',
    //   ),
    //   const TeamUser(
    //     imageUrl:
    //         'https://orenburg.media/wp-content/uploads/2021/04/9yg-T5yIqOw.jpg',
    //     name: 'Абдуросик Вартанов',
    //   ),
    //   const TeamUser(
    //     imageUrl:
    //         'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Conor_McGregor_2018.jpg/270px-Conor_McGregor_2018.jpg',
    //     name: 'Конор Мурмагомедов',
    //   ),
    // ]);
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
                      onClick: () {
                        Navigator.of(context).pushNamed('/match');
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
              Navigator.of(context).pushNamed('/profile');
            },
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: NetworkImage(_users[index].imageUrl),
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
