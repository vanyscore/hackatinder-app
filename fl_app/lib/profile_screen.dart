import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран профиля'),
      ),
      body: Column(
        children: [
          Text('')
        ],
      ),
    );
  }

  Widget _buildField(String title, String description) {
    return Row(
      children: [
        Text(title, style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),)
      ],
    )
  }
}