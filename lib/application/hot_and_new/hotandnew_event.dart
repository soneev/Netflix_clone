part of 'hotandnew_bloc.dart';

@freezed
class HotandnewEvent with _$HotandnewEvent {
  const factory HotandnewEvent.loadDataInComingSoon() = loadDataInComingSoon;
  const factory HotandnewEvent.loadDataInEveryoneIsWatching() =
      loadDataInEveryoneIsWatching;
}
