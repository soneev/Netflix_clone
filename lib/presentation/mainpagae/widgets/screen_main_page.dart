import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/mainpagae/widgets/bottom_nav.dart';
import 'package:netflix/presentation/mainpagae/widgets/fast_laugh/fast_laugh.dart';
import 'package:netflix/presentation/mainpagae/widgets/search/search.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_hot.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastAndLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return pages[index];
            }),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
