import 'package:fl_app/matcher/match_card.dart';
import 'package:fl_app/matcher/match_model.dart';
import 'package:fl_app/repos/user_model.dart';
import 'package:fl_app/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  late final SwipableStackController _controller;

  bool _isLoading = true;
  final List<UserModel> _matchList = [];
  final List<UserModel> _matched = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final repo = Provider.of<UserRepo>(
        context,
        listen: false,
      );

      final users = await repo.getUsers();

      if (users.isNotEmpty) {
        setState(() {
          _matchList.addAll(
            users,
          );
          _isLoading = false;
        });
      }
    });

    _controller = SwipableStackController();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasicExample'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(_matched);
          },
        ),
      ),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: _isLoading
                    ? _buildLoading()
                    : _matchList.isEmpty
                        ? _buildEmpty()
                        : _buildStack(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmpty() {
    return const Center(
      child: Text(
        'Вы просмотрели всех участников.',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildStack() {
    return SwipableStack(
      itemCount: _matchList.length,
      controller: _controller,
      detectableSwipeDirections: const {
        SwipeDirection.right,
        SwipeDirection.left,
      },
      stackClipBehaviour: Clip.none,
      onSwipeCompleted: (index, direction) {
        if (direction == SwipeDirection.right) {
          _matched.add(_matchList[index]);
        }
      },
      horizontalSwipeThreshold: 0.8,
      verticalSwipeThreshold: 0.8,
      builder: (context, properties) {
        return MatchCard(
          model: _matchList[properties.index],
          onCancel: () {
            _controller.next(swipeDirection: SwipeDirection.left);
          },
          onAccept: () {
            _controller.next(swipeDirection: SwipeDirection.right);
          },
        );
      },
    );
  }
}
