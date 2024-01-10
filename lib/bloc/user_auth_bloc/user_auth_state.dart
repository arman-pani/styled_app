part of 'user_auth_bloc.dart';

sealed class UserAuthState {}

final class UserAuthInitial extends UserAuthState {}

final class UserAuthSuccess extends UserAuthState {}

final class UserAuthFailure extends UserAuthState {
  final String error;
  UserAuthFailure({required this.error});
}

final class UserAuthLoading extends UserAuthState {}
