import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_info_drawer.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);
  int _currentHomeIndex = 0;
  bool showTaskDrawer = false;

  void _onSwipe(DragUpdateDetails details) {
    pageController.animateTo(pageController.offset - details.delta.dx,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void _onSwipeEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        pageController.previousPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    } else {
      if (pageController.offset.abs() > MediaQuery.of(context).size.width / 2) {
        if (pageController.offset > 0) {
          pageController.previousPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        }
      } else {
        pageController.animateTo(
          _currentHomeIndex * MediaQuery.of(context).size.width,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onHorizontalDragUpdate: _onSwipe,
      onHorizontalDragEnd: _onSwipeEnd,
      child: PageView(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            _currentHomeIndex = value;
          });
        },
        children: [_buildTimerView(), _buildTaskListView()],
      ),
    );
  }

  Widget _buildTimerView() {
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              showTaskDrawer = false;
            });
          },
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  onPressed: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Row(
                    children: [
                      Text('Task List'),
                      SizedBox(
                        width: 1,
                      ),
                      Icon(
                        Icons.arrow_right_sharp,
                        size: 24.0,
                      ),
                    ],
                  ),
                )
              ]),
              Center(
                child: Container(
                  height: height / 3,
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  child: const Center(
                    child: Text(
                      'TIMER',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        showTaskDetail()
      ],
    );
  }

  AnimatedPositioned showTaskDetail() {
    double height = MediaQuery.of(context).size.height;
    var drawerThreshold = 100;

    return AnimatedPositioned(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        left: 0,
        bottom: showTaskDrawer ? -40 : -(height / 6),
        child: GestureDetector(
            onPanEnd: (details) {
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

Widget _buildTaskListView() {
  return const SizedBox(
    child: TodoList(),
  );
}
