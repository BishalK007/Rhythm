import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../widgets/b_nav.dart';
import '../pages/mini_player.dart';
import '../pages/search_page.dart';
import '../services/colours.dart';
import '../services/screen_sizes.dart';

class SearchButtonWithLogic extends StatelessWidget {
  const SearchButtonWithLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: playerExpandProgress,
        builder: (BuildContext context, double minPlayerHeight, Widget? child) {
          if (minPlayerHeight <= 100) {
            return ValueListenableBuilder<int>(
                valueListenable: navIndexListener,
                builder: (BuildContext context, int value, Widget? child) {
                  if (value != 3) {
                    return ValueListenableBuilder<bool>(
                      valueListenable: miniPlayerVisibilityListenable,
                      builder:
                          (BuildContext context, bool playing, Widget? child) {
                        if (playing) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(
                                0, 0, 15, 80 + 60 + 10),
                            child: const SearchButton(),
                          );
                        } else {
                          return Container(
                            padding:
                                const EdgeInsets.fromLTRB(0, 0, 15, 60 + 10),
                            child: const SearchButton(),
                          );
                        }
                      },
                    );
                  } else {
                    return Container();
                  }
                });
          } else {
            return Container();
          }
        });
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navIndexListener.value == 2) {
        } else {
          Navigator.of(context).push(
            PageAnimationTransition(
                page: const SearchPage(),
                pageAnimationType: LeftToRightFadedTransition()),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const SearchPage(),
          //   ),
          // );
        }
      },
      child: Container(
        height: (logicalWidth * 0.16),
        width: (logicalWidth * 0.16),
        decoration: BoxDecoration(
          color: bgPurple,
          borderRadius: BorderRadius.all(Radius.circular(logicalWidth * 0.05)),
        ),
        child: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}
