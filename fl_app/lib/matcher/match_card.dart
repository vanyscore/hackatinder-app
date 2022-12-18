import 'package:fl_app/matcher/match_model.dart';
import 'package:fl_app/repos/user_model.dart';
import 'package:fl_app/widgets/circle_button.dart';
import 'package:fl_app/widgets/tag.dart';
import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final UserModel model;
  final TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  final VoidCallback onCancel;
  final VoidCallback onAccept;

  const MatchCard({
    super.key,
    required this.model,
    required this.onCancel,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          model.photoUrl,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                model.name,
                style: textStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              /* Text(
                model.description,
                style: textStyle,
              ),
              const SizedBox(
                height: 20,
              ),*/
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: model.skills
                      .map(
                        (e) => Tag(
                          name: e,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButton(
                    onPressed: onCancel,
                    color: Colors.red,
                    icon: const Icon(
                      size: 40,
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  CircleButton(
                    onPressed: onAccept,
                    color: Colors.lightGreenAccent,
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
