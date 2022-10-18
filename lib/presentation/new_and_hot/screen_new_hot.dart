import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hotandnew_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/new_and_hot/widget/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widget/everyones_widgets.dart';
import 'package:netflix/presentation/new_and_hot/widget/video_widgets.dart';
import 'package:netflix/widgets/app_bar_widget.dart';
import 'package:netflix/widgets/custom_button.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              width,
              Container(color: Colors.blue, height: 30, width: 30),
              width
            ],
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: kWhitecolor,
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator:
                  BoxDecoration(color: kWhitecolor, borderRadius: kradius30),
              tabs: [
                const Tab(
                  text: "🍿coming soon",
                ),
                const Tab(
                  text: "👀 Everyone's watching",
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            comingsoonList(
              key: Key("coming_soon"),
            ),
            EveryOneIsWatchingList(
              key: Key("everyoneisWatching"),
            ),
          ],
        ),
      ),
    );
  }
}

class comingsoonList extends StatelessWidget {
  const comingsoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const loadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotandnewBloc>(context)
            .add(const loadDataInComingSoon());
      },
      child:
          BlocBuilder<HotandnewBloc, HotandnewState>(builder: (context, state) {
        if (state.isLoading) {
          print("loading data");
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading coming soon list"),
          );
        } else if (state.comingsoonList.isEmpty) {
          return const Center(
            child: Text(" coming soon list is Empty"),
          );
        } else {
          return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: state.comingsoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingsoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                print(movie.releaseDate);
                final _date = DateTime.parse(movie.releaseDate!);

                final formatedDate = DateFormat.d('en_US').format(_date);
                final formatedMonth = DateFormat.MMM('en_US').format(_date);
                final formatedYear = DateFormat.y('en_US').format(_date);
                print(formatedDate);
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formatedMonth.toUpperCase(),

                  //"MAR"
                  // day: movie.releaseDate!.split('_')[1],
                  day: formatedDate,
                  //'11',
                  posterPath: '$ImageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No title',
                  description: movie.overview ?? 'No description',
                );
              });
        }
      }),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context)
          .add(const loadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotandnewBloc>(context)
            .add(const loadDataInEveryoneIsWatching());
      },
      child:
          BlocBuilder<HotandnewBloc, HotandnewState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading coming soon list"),
          );
        } else if (state.everyoneisWatchingList.isEmpty) {
          return const Center(
            child: Text(" coming soon list is Empty"),
          );
        } else {
          return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.everyoneisWatchingList.length,
              itemBuilder: (BuildContext context, index) {
                final tv = state.everyoneisWatchingList[index];
                if (tv.id == null) {
                  return const SizedBox();
                }

                return EveryonesWatching(
                  posterPath: '$ImageAppendUrl${tv.posterPath}',
                  movieName: tv.originalName ?? 'No name provided',
                  description: tv.overview ?? 'No description',
                );
              });
        }
      }),
    );
  }
}
