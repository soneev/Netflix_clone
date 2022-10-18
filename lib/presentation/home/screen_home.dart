import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';

import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/home/background_card.dart';

import 'package:netflix/presentation/home/number_title_card.dart';

import '../../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                }
                // else if (state.hasError) {
                //   return const Center(
                //     child: Text(
                //       "Error while Getting Data",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   );
                // }

                // released past year
                final _releasesPastYear = state.pastYearMovieList.map((m) {
                  return '$ImageAppendUrl${m.posterPath}';
                }).toList();
                //Trending
                final _trending = state.trendingMovieList.map((m) {
                  return '$ImageAppendUrl${m.posterPath}';
                }).toList();
                _trending.shuffle();
                // tense dramas
                final _tenseDramas = state.tenseMovieList.map((m) {
                  return '$ImageAppendUrl${m.posterPath}';
                }).toList();
                _tenseDramas.shuffle();

                // south indian movies
                final _southIndianMOvies = state.southIndianMovieList.map((m) {
                  return '$ImageAppendUrl${m.posterPath}';
                }).toList();
                _southIndianMOvies.shuffle();
                //top10 tv shows
                final _top10TvShows = state.trendingTvList.map((t) {
                  return '$ImageAppendUrl${t.posterPath}';
                }).toList();
                _top10TvShows.shuffle();

// list view
                return ListView(
                  children: [
                    BackgroundCard(),
                    if (_releasesPastYear.length >= 10)
                      MainTitleCard(
                        title: "Released in the past year",
                        posterList:
                            // _releasesPastYear,
                            _releasesPastYear.sublist(0, 10),
                      ),
                    khight,
                    if (_trending.length >= 10)
                      MainTitleCard(
                        title: "Trending Now",
                        posterList: _trending.sublist(0, 10),
                        //  _trending,
                      ),
                    khight,
                    if (_top10TvShows.length >= 10)
                      NumberTitleCard(
                        posterList:

                            //_top10TvShows
                            _top10TvShows.sublist(0, 10),
                      ),
                    khight,
                    if (_tenseDramas.length >= 10)
                      MainTitleCard(
                        title: "Tense Dramas",
                        posterList:
                            // _tenseDramas
                            _tenseDramas.sublist(0, 10),
                      ),
                    khight,
                    if (_southIndianMOvies.length >= 10)
                      MainTitleCard(
                        title: "South Indian Cinema",
                        posterList:
                            //_southIndianMOvies
                            _southIndianMOvies.sublist(9, 20),
                      ),
                  ],
                );
              }),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 60,
                                child: Image.asset("assets/netflixlogo.png"),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                              ),
                              width,
                              Container(
                                  color: Colors.blue, height: 30, width: 30),
                              width
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "Tv Shows",
                                style: kHomeTitleText,
                              ),
                              Text("Movies", style: kHomeTitleText),
                              Text(
                                "Categories",
                                style: kHomeTitleText,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : khight
            ],
          ),
        );
      },
    ));
  }
}
