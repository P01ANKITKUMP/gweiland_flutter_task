part of 'trigger_cubit.dart';

sealed class TriggerState extends Equatable {
  const TriggerState();

  @override
  List<Object> get props => [];
}

final class TriggerInitial extends TriggerState {
  final TriggerModel triggerModel;
  const TriggerInitial({required this.triggerModel});

  @override
  List<Object> get props => [triggerModel];
}
