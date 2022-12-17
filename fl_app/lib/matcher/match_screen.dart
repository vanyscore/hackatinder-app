import 'package:fl_app/matcher/match_card.dart';
import 'package:fl_app/matcher/match_model.dart';
import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  // late final SwipableStackController _controller;

  final _matchList = [
    MatchModel(
      imageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      name: 'Вася Пупкин',
      description:
          'Супер кодер. Ебашу джаваскрипт. Ну и просто ебашу. Болею за Хасбика. Антихайп!',
      tags: ['JS', 'React', 'Frontend'],
    ),
    MatchModel(
      imageUrl:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      name: 'Вася Пупкин',
      description:
          'Супер кодер. Ебашу джаваскрипт. Ну и просто ебашу. Болею за Хасбика. Антихайп!',
      tags: ['JS', 'React', 'Frontend'],
    ),
    MatchModel(
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      name: 'Вася Пупкин',
      description:
          'Супер кодер. Ебашу джаваскрипт. Ну и просто ебашу. Болею за Хасбика. Антихайп!',
      tags: ['JS', 'React', 'Frontend'],
    ),
    MatchModel(
      imageUrl:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      name: 'Вася Пупкин',
      description:
          'Супер кодер. Ебашу джаваскрипт. Ну и просто ебашу. Болею за Хасбика. Антихайп!',
      tags: ['JS', 'React', 'Frontend'],
    ),
    MatchModel(
      imageUrl:
          'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
      name: 'Вася Пупкин',
      description:
          'Супер кодер. Ебашу джаваскрипт. Ну и просто ебашу. Болею за Хасбика. Антихайп!',
      tags: ['JS', 'React', 'Frontend'],
    ),
  ];

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    // _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    // _controller
    //   ..removeListener(_listenController)
    //   ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasicExample'),
      ),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SwipableStack(
                  itemCount: _matchList.length,
                  detectableSwipeDirections: const {
                    SwipeDirection.right,
                    SwipeDirection.left,
                  },
                  stackClipBehaviour: Clip.none,
                  onSwipeCompleted: (index, direction) {
                    print('$index, $direction');
                  },
                  horizontalSwipeThreshold: 0.8,
                  verticalSwipeThreshold: 0.8,
                  builder: (context, properties) {
                    return MatchCard(model: _matchList[properties.index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
