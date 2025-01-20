part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final Map<String, dynamic> json;

  HomeLoaded(this.json);
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
