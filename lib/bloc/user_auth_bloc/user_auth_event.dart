part of 'user_auth_bloc.dart';

sealed class UserAuthEvent {}

final class UserAuthLoginRequested extends UserAuthEvent {
  final String email;
  final String password;

  UserAuthLoginRequested({required this.email, required this.password});
}

final class UserAuthLogoutRequested extends UserAuthEvent {}
