import 'package:auto_route/auto_route.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaraunts/routes/router.gr.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      routes: const [
        ReviewRouter(),
        PartysRouter(),
        ProfileRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return DotNavigationBar(
          marginR: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          borderRadius: 10,
          enableFloatingNavBar: true,
          backgroundColor: const Color(0xFF282828),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],

          dotIndicatorColor: const Color(0xFFBF5AF2),
          selectedItemColor: const Color(0xFFBF5AF2),
          unselectedItemColor: const Color(0xFFDADADA),
          // enableFloatingNavBar: false,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            /// View
            DotNavigationBarItem(
              icon: const Icon(Icons.grid_view_rounded),
              selectedColor: const Color(0xFFBF5AF2),
            ),

            /// MyPartys
            DotNavigationBarItem(
              icon: const Icon(Icons.map_outlined),
              selectedColor: const Color(0xFFBF5AF2),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              selectedColor: const Color(0xFFBF5AF2),
            ),
          ],
        );
      },
    );
  }
}
