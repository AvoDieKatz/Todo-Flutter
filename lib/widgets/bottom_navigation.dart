import 'package:flutter/material.dart';

// class BottomNavigation extends StatefulWidget {
//   final void Function(int) updateIndex;
  
//   const BottomNavigation({super.key, required this.updateIndex});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;

//     return SizedBox(
        
//         child: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "Tasks"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.query_stats), label: "Report"),
//           ],
//           currentIndex: ,
//           type: BottomNavigationBarType.fixed,
//           selectedFontSize: textTheme.bodySmall!.fontSize!,
//           unselectedFontSize: textTheme.bodySmall!.fontSize!,
//           onTap: (index) {
//             updateIndex(index);
//             // setState(() {
//             //   currentIndex = index;
//             // });
//           },
//           selectedItemColor: colorScheme.onPrimary,
//           unselectedItemColor: colorScheme.onPrimary.withOpacity(0.58),
//           backgroundColor: colorScheme.primary,
//         ),
//       );
//   }
// }

class BottomNavigation extends StatelessWidget {
  final void Function(int) updateIndex;
  final int currentIndex;
  const BottomNavigation({super.key, required this.updateIndex, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
        
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.query_stats), label: "Report"),
          ],
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: textTheme.bodySmall!.fontSize!,
          unselectedFontSize: textTheme.bodySmall!.fontSize!,
          onTap: (index) {
            updateIndex(index);
            // setState(() {
            //   currentIndex = index;
            // });
          },
          selectedItemColor: colorScheme.onPrimary,
          unselectedItemColor: colorScheme.onPrimary.withOpacity(0.58),
          backgroundColor: colorScheme.primary,
        ),
      );
  }
}