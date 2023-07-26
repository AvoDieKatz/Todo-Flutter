import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> with TickerProviderStateMixin {
  // late final AnimationController _fadeController;
  // late final AnimationController _sizeController;

  @override
  void initState() {
    super.initState();
    // _fadeController = AnimationController(
    //   duration: const Duration(seconds: 1),
    //   vsync: this,
    // )..repeat(reverse: true);

    // _sizeController = AnimationController(
    //   duration: const Duration(milliseconds: 850),
    //   vsync: this,
    // )..repeat(reverse: true);
  }

  @override
  void dispose() {
    // _fadeController.dispose();
    // _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'tag-list-1',
          child: Material(
            child: ListTile(
              title: const Text('ListTile with Hero'),
              subtitle: const Text('Tap here for Hero transition'),
              tileColor: Theme.of(context).colorScheme.secondaryContainer,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(builder: (BuildContext context) {
                    return Scaffold(
                        appBar: AppBar(title: const Text('Todo Title')),
                        body: Column(children: [
                          Hero(
                            tag: 'ListTile-Hero',
                            child: Material(
                              child: ListTile(
                                title: const Text('ListTile with Hero'),
                                subtitle: const Text('Tap here to go back'),
                                tileColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ])
                        );
                  }),
                );
              },
            ),
          ),
        ),
        const Divider(),
        Hero(
          tag: 'tag-list-2',
          child: Material(
            child: ListTile(
              title: const Text('ListTile with Hero 2'),
              subtitle: const Text('Tap here for Hero transition'),
              tileColor: Theme.of(context).colorScheme.secondaryContainer,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(builder: (BuildContext context) {
                    return Scaffold(
                        appBar: AppBar(title: const Text('Todo Title')),
                        body: Column(children: [
                          Hero(
                            tag: 'ListTile-Hero-2',
                            child: Material(
                              child: ListTile(
                                title: const Text('ListTile with Hero 2'),
                                subtitle: const Text('Tap here to go back'),
                                tileColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ])
                        );
                  }),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('ListTile Samples')),
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: <Widget>[
  //         Hero(
  //           tag: 'ListTile-Hero',
  //           // Wrap the ListTile in a Material widget so the ListTile has someplace
  //           // to draw the animated colors during the hero transition.
  //           child: Material(
  //             child: ListTile(
  //               title: const Text('ListTile with Hero'),
  //               subtitle: const Text('Tap here for Hero transition'),
  //               tileColor: Colors.cyan,
  //               onTap: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute<Widget>(builder: (BuildContext context) {
  //                     return Scaffold(
  //                       appBar: AppBar(title: const Text('ListTile Hero')),
  //                       body: Center(
  //                         child: Hero(
  //                           tag: 'ListTile-Hero',
  //                           child: Material(
  //                             child: ListTile(
  //                               title: const Text('ListTile with Hero'),
  //                               subtitle: const Text('Tap here to go back'),
  //                               tileColor: Colors.blue[700],
  //                               onTap: () {
  //                                 Navigator.pop(context);
  //                               },
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     );
  //                   }),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
