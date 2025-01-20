import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/home_screen/home_cubit.dart';
import 'package:mirai/mirai.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(username),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => switch (state) {
          HomeInitial() ||
          HomeLoading() =>
            const Center(child: CircularProgressIndicator()),
          HomeLoaded() =>
            Mirai.fromJson(state.json, context) ?? const SizedBox(),
          HomeError() => Center(child: Text(state.message)),
        },
      ),
    );
  }
}
