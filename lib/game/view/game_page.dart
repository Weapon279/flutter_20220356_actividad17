import 'package:flutter/material.dart';
import 'package:flutter_act15_20220324/game/bloc/game_bloc.dart';

import '../bloc/game_state.dart';
import 'game_finished_view.dart';
import 'select_location_view.dart';




class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(padding: EdgeInsets.all(16), child: _GameView()),
        ),
      ),
    );
  }
}

class _GameView extends StatelessWidget {
  const _GameView();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GameBloc, GameState, GameStatus>(
      selector: (state) => state.status,
      builder: (context, status) => switch (status) {
        GameStatus.initial => const SelectLocationView(),
        GameStatus.inProgress => const ScavengerHuntView(),
        GameStatus.finished => const GameFinishedView(),
      },
    );
  }
}