import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PageHome> {
  final List myTitle = [
    "A",
    "B",
    "C",
    "D",
  ];
  void updateMyTitle(int oldInex, int newIndex) async {
    setState(() {
      if (oldInex < newIndex) {
        newIndex--;
      }
      final tile = myTitle.removeAt(oldInex);
      myTitle.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Drag Drop List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ReorderableListView(
        children: [
          for (final tile in myTitle)
            ListTile(
              key: ValueKey(tile),
              title: Text(tile),
            ),
        ],
        onReorder: (oldIndex, newIndex) => updateMyTitle(oldIndex, newIndex),
      ),
    );
  }
}
