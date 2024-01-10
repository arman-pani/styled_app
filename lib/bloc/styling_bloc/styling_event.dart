part of 'styling_bloc.dart';

@immutable
sealed class StylingEvent {}

final class StylingRequested extends StylingEvent {
  final String contentImageUrl;
  final String styleImageUrl;

  StylingRequested({
    required this.contentImageUrl,
    required this.styleImageUrl,
  });
}

final class StylingDeleted extends StylingEvent {}
