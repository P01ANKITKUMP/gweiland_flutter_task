import 'package:equatable/equatable.dart';
import 'package:gweiland_flutter_task/domain/entity/trigger_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'trigger_state.dart';

class TriggerCubit extends HydratedCubit<TriggerState> {
  TriggerCubit()
      : super(const TriggerInitial(
            triggerModel: TriggerModel(tapValue: 0, totalSuccessCount: 0)));

  @override
  TriggerState? fromJson(Map<String, dynamic> json) {
    try {
      return TriggerInitial(
          triggerModel: TriggerModel.fromJson(
              json['triggerModel'] as Map<String, dynamic>));
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(TriggerState state) {
    if (state is TriggerInitial) {
      return {'triggerModel': state.triggerModel.toJson()}; ////
    }
    return null;
  }

  void tapping(int tapValue, int totalAchived, bool isEqual) {
    if (state is TriggerInitial) {
      final currentState = state as TriggerInitial;
      final update = currentState.triggerModel.copyWith(
          tapValue: tapValue,
          totalSuccessCount: totalAchived,
          isEqual: isEqual);
      emit(TriggerInitial(triggerModel: update));
    }
  }
}
