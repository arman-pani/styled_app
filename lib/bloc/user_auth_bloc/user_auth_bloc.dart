import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc() : super(UserAuthInitial()) {
    on<UserAuthLoginRequested>(_onUserAuthLoginRequested);
    on<UserAuthLogoutRequested>(_onUserAuthLogoutRequested);
  }

  @override
  void onChange(Change<UserAuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    debugPrint("UserAuthBloc - $change");
  }

  @override
  void onTransition(Transition<UserAuthEvent, UserAuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    debugPrint("UserAuthBloc - $transition");
  }

  void _onUserAuthLoginRequested(
    UserAuthLoginRequested event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(
        UserAuthLoading()); //after pressing the button, screen will load for checking the password and email

    try {
      final email = event.email;
      final password = event.password;
      if (!EmailValidator.validate(email)) {
        return emit(UserAuthFailure(error: 'Invalid Email!'));
      }

      if (password.length < 6) {
        return emit(UserAuthFailure(
            error: "Password should be more than 6 characters!"));
      }

      await Future.delayed(
        const Duration(seconds: 3),
        () {
          return emit(UserAuthSuccess());
        },
      );
    } catch (e) {
      return emit(UserAuthFailure(error: e.toString()));
    }
  }

  void _onUserAuthLogoutRequested(
    UserAuthLogoutRequested event,
    Emitter<UserAuthState> emit,
  ) {
    try {
      return emit(UserAuthInitial()); // returns to initial state after logout
    } catch (e) {
      return emit(UserAuthFailure(error: e.toString()));
    }
  }
}
