import 'package:fl_app/app_colors.dart';
import 'package:fl_app/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final _textStyle = const TextStyle(
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_buildTitle(), _buildAppName()],
    );
  }

  Widget _buildTitle() => const Text('HACKADOO', style: AppTextStyle.s38w500);

  Widget _buildAppName() => Text(
        'МММ "Рога и копыта"',
        style: AppTextStyle.s27w400.copyWith(
          color: Colors.white,
        ),
      );
}
