import 'dart:ui';

import 'package:fl_app/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String text;
  final Function onClick;

  const MyButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      color: AppColors.main,
        onPressed: () => onClick(),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
  }

}