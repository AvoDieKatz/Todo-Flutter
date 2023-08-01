import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final void Function(int) updateIndex;
  final int currentIndex;
  const BottomNavigation(
      {super.key, required this.updateIndex, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: "Add Task"),
          BottomNavigationBarItem(
              icon: Icon(Icons.query_stats), label: "Report"),
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: textTheme.bodySmall!.fontSize!,
        unselectedFontSize: textTheme.bodySmall!.fontSize!,
        onTap: (index) {
          updateIndex(index);
        },
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.48),
        backgroundColor: colorScheme.primary,
      ),
    );
  }
}
