import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netflix/presentation/fast_laugh/widget/video_list_item.dart';

class ScreenFastAndLaugh extends StatelessWidget {
  const ScreenFastAndLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastlaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(child:
          BlocBuilder<FastlaughBloc, FastlaughState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text("ERROR while getting data"),
          );
        } else if (state.videosList.isEmpty) {
          return const Center(
            child: Text("VideoList is Empty"),
          );
        } else {
          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(state.videosList.length, (index) {
              return VideoListItemInheritedWidget(
                widget: VideoListItems(
                  key: Key(index.toString()),
                  index: index,
                ),
                movieData: state.videosList[index],
              );

              // VideoListItems(
              //   index: index,
              // );
            }),
          );
        }
      })),
    );
  }
}
