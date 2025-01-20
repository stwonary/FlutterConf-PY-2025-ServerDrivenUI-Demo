import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.username) : super(HomeInitial()) {
    load();
  }

  final String username;

  void load() async {
    emit(HomeLoading());
    try {
      final response = await http
          .get(Uri.parse('http://localhost:8000/screen/home_screen/$username'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        emit(HomeLoaded(json));
      } else {
        emit(HomeError('Failed to load data: ${response.statusCode}'));
      }
    } catch (e) {
      emit(HomeError('An error occurred: $e'));
    }
  }
}
