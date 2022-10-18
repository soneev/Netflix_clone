import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_service.dart';
import 'package:netflix/presentation/new_and_hot/widget/everyones_widgets.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewService _hotAndNewService;
  HotandnewBloc(this._hotAndNewService) : super(HotandnewState.initial()) {
    /*get hot and new movie data*/

    on<loadDataInComingSoon>((event, emit) async {
// send loading to ui
      emit(const HotandnewState(
          comingsoonList: [],
          everyoneisWatchingList: [],
          isLoading: true,
          hasError: false));
      // get data from remote

      final _result = await _hotAndNewService.getHotAndNewMovieData();

      final newState = _result.fold((MainFailure failure) {
        return const HotandnewState(
          comingsoonList: [],
          everyoneisWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        return HotandnewState(
          comingsoonList: resp.results!,
          everyoneisWatchingList: state.everyoneisWatchingList,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });

    /*get hot and new tv data*/
    on<loadDataInEveryoneIsWatching>((event, emit) async {
      emit(const HotandnewState(
          comingsoonList: [],
          everyoneisWatchingList: [],
          isLoading: true,
          hasError: false));
      // get data from remote

      final _result = await _hotAndNewService.getHotAndNewTvData();
      // getHotAndNewMovieData();

      final newState = _result.fold((MainFailure failure) {
        return const HotandnewState(
          comingsoonList: [],
          everyoneisWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResp resp) {
        return HotandnewState(
          comingsoonList: state.comingsoonList,
          everyoneisWatchingList: resp.results!,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
  }
}
