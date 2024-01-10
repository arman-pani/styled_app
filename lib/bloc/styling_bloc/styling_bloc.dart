import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'styling_event.dart';
part 'styling_state.dart';

class StylingBloc extends Bloc<StylingEvent, StylingState> {
  StylingBloc() : super(StylingInitial()) {
    on<StylingRequested>(_onStylingRequested);
    on<StylingDeleted>(_onStylingDeleted);
  }
  void _onStylingRequested(
    StylingRequested event,
    Emitter<StylingState> emit,
  ) async {
    emit(StylingLoading());
    try {
      final contentImageUrl = event.contentImageUrl;
      final stylingImageUrl = event.styleImageUrl;

      final outputImageUrl = contentImageUrl;
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          return emit(StylingSuccess(outputImageUrl: outputImageUrl));
        },
      );
    } catch (e) {
      return emit(StylingFailure(error: e.toString()));
    }
  }

  void _onStylingDeleted(
    StylingDeleted event,
    Emitter<StylingState> emit,
  ) {
    try {
      return emit(StylingInitial()); // returns to initial state after logout
    } catch (e) {
      return emit(StylingFailure(error: e.toString()));
    }
  }
}
