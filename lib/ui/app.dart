import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:todo_app/ui/home_page.dart';
import 'package:todo_app/ui/report_page.dart';
import 'package:todo_app/ui/tasks_page.dart';
import 'package:todo_app/widgets/bottom_navigation.dart';

class App extends StatefulWidget {
  const App({super.key, required this.title});

  final String title;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  var appPages = <Widget>[
    const HomePage(),
    const TasksPage(),
    const ReportPage()
  ];

  void _updateIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(widget.title),
        ),
        body: SizedBox(
          height:  height,
          width:  width,
          child: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: _NavigationDestinationView(
              // Adding [UniqueKey] to make sure the widget rebuilds when transitioning.
              key: UniqueKey(),
              item: _NavigationDestinationView(item: appPages[_currentIndex]),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          updateIndex: _updateIndex,
          currentIndex: _currentIndex,
        ));
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({super.key, required this.item});

  final Widget item;

  @override
  Widget build(BuildContext context) {
    return Container(child: item);
  }
}
