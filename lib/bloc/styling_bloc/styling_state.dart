part of 'styling_bloc.dart';

@immutable
sealed class StylingState {}

final class StylingInitial extends StylingState {}

final class StylingSuccess extends StylingState {
  final String outputImageUrl;

  StylingSuccess({required this.outputImageUrl});
}

final class StylingFailure extends StylingState {
  final String error;

  StylingFailure({required this.error});
}

final class StylingLoading extends StylingState {}
