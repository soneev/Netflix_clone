import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_service.dart';

import '../../domain/hot_and_new/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homService;

  HomeBloc(this._homService) : super(HomeState.initial()) {
    /*
     on event get homescreen data
     */
    on<GetHomeScreenData>((event, emit) async {
      log("getting home screeen data");
      // send loading to ui

      emit(state.copyWith(isLoading: true, hasError: false));

      // get data
      final _movieResult = await _homService.getHotAndNewMovieData();
      final _tvResult = await _homService.getHotAndNewTvData();

      // transform data

      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingMovieList: [],
              tenseMovieList: [],
              southIndianMovieList: [],
              trendingTvList: [],
              isLoading: false,
              hasError: true);
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;

          pastYear!.shuffle();
          trending!.shuffle();
          dramas!.shuffle();
          southIndian!.shuffle();
          return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: pastYear,
              trendingMovieList: trending,
              tenseMovieList: dramas,
              southIndianMovieList: southIndian,
              trendingTvList: state.trendingTvList,
              isLoading: false,
              hasError: true);
        },
      );
      emit(_state1);

      final _state2 = _tvResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final _to10List = resp.results;
        // if (_to10List != null) {
        //   _to10List = resp.results;
        // }
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseMovieList: state.tenseMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: _to10List!,
            isLoading: false,
            hasError: true);
      });
      emit(_state2);
      // send  to ui
    });
  }
}
