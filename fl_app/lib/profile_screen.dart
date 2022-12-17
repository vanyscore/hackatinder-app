import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 75, horizontal: 16),
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/400/200'),
              radius: 75, 
            ),
            SizedBox(height: 24),
            Text(
              "Иванов Иван Иванович",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24),
            Row(children: [
              Text(
                "Обо мне",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              )
            ]),
            SizedBox(height: 8),
            Text("Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от всего сердца. Я совсем один и блаженствую в здешнем краю, словно созданном для таких, как я. Я так счастлив, мой друг, так упоен ощущением покоя, что искусство мое страдает от этого.",
              
            ),
            SizedBox(height: 16),
            Row(children: [
              Text(
                "Мои навыки",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              )
            ]),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                
                
                children: [
                  Tag(name: "python"),
                  Tag(name: "javascript"),
                  Tag(name: "enrish language"),
                  Tag(name: "git"),
                  Tag(name: "docker"),
                  Tag(name: "fisting"),
                  Tag(name: "c#"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String name;

  const Tag({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(name),
    );
  }
}
