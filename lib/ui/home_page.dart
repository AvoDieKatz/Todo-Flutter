import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_info_drawer.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    // required this.switchViewPressed,
  });

  // final VoidCallback switchViewPressed;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  bool showTaskDrawer = false;
  bool showTaskList = false;

  // void switchViewPressed() {
  //   _pageController.nextPage(
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void _onSwipe(DragUpdateDetails details) {
    _pageController.animateTo(_pageController.offset - details.delta.dx,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void _onSwipeEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    } else {
      if (_pageController.offset.abs() >
          MediaQuery.of(context).size.width / 2) {
        if (_pageController.offset > 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        }
      } else {
        _pageController.animateTo(
          _currentPageIndex * MediaQuery.of(context).size.width,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onHorizontalDragUpdate: _onSwipe,
      onHorizontalDragEnd: _onSwipeEnd,
      child: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            _currentPageIndex = value;
          });
          // switchHomeView(value);
        },
        children: [
          _buildTimerView(height, width),
          _buildTaskListView(height, width)
        ],
      ),
    );
  }

  Widget _buildTimerView(double height, double width) {
    var drawerThreshold = 100;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              showTaskDrawer = false;
            });
          },
          child: Container(
            height: height,
            width: width,
            // color: Theme.of(context).colorScheme.primaryContainer,
            margin: EdgeInsets.fromLTRB(32, 0, 32, height / 6),
            decoration: const BoxDecoration(
                color: Colors.blueGrey, shape: BoxShape.circle),
            child: const Center(
              child: Text(
                'TIMER',
              ),
            ),
          ),
        ),
        showTaskDetail(height, drawerThreshold)
      ],
    );
  }

  AnimatedPositioned showTaskDetail(double height, int drawerThreshold) {
    return AnimatedPositioned(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        left: 0,
        bottom: showTaskDrawer ? -40 : -(height / 6),
        child: GestureDetector(
            onPanEnd: (details) {
              // debugPrint(details.velocity.pixelsPerSecond.dy.toString());
              if (details.velocity.pixelsPerSecond.dy > drawerThreshold) {
                setState(() {
                  showTaskDrawer = false;
                });
              } else if (details.velocity.pixelsPerSecond.dy <
                  -drawerThreshold) {
                setState(() {
                  showTaskDrawer = true;
                });
              }
            },
            child: const TaskInfoDrawer()));
  }
}

Widget _buildTaskListView(double height, double width) {
  return SizedBox(
    width: width,
    height: height,
    child: const TodoList(),
  );
}
