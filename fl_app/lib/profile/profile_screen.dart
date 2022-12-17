import 'package:fl_app/widgets/tag.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 16),
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/400/200'),
              radius: 75,
            ),
            const SizedBox(height: 24),
            const Text(
              "Иванов Иван Иванович",
              style: TextStyle(
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
                children: const [
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
