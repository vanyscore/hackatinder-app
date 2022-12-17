import 'package:fl_app/app_colors.dart';
import 'package:fl_app/app_text_style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Icon(
            size: 40,
            Icons.swipe,
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildTitle(),
          _buildDate(),
          const SizedBox(
            height: 40,
          ),
          _buildAppName(),
          const SizedBox(
            height: 20,
          ),
          _buildAuthors(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                )),
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
            child: Text('Перейти'),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildTitle() => Text(
        'Hackado',
        style: _defaultStyle(AppTextStyle.s38w500),
        textAlign: TextAlign.center,
      );

  Widget _buildAppName() => const Text(
        'МММ "Рога и копыта"',
        style: TextStyle(
          fontSize: 18,
          color: AppColors.grey,
        ),
        textAlign: TextAlign.center,
      );

  Widget _buildAuthors() {
    return const Text(
      'Антон Белозеров • Рашит Ибрагимов • Пичугин Иван • Кирилл Климов',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.grey,
      ),
    );
  }

  Widget _buildDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Челябинск - 2022',
          style: TextStyle(
            color: AppColors.grey,
          ),
        )
      ],
    );
  }

  TextStyle _defaultStyle(TextStyle style) {
    return style.copyWith(
      color: Colors.white,
    );
  }
}
