import 'package:flutter/material.dart';

import 'main.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<Item> items = [
    Item('Item 1', false),
    Item('Item 2', false),
    Item('Item 3', false),
    Item('Item 4', false),
    Item('Item 5', false),
  ];

  void toggleItemSelection(int index) {
    setState(() {
      items[index].isSelected = !items[index].isSelected;
    });
  }

  int getSelectedCount() {
    return items.where((item) => item.isSelected).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Items'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index].name),
            onTap: () {
              toggleItemSelection(index);
            },
            tileColor: items[index].isSelected ? Colors.blue[100] : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Selected Items'),
                content:
                    Text('Number of selected items: ${getSelectedCount()}'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
