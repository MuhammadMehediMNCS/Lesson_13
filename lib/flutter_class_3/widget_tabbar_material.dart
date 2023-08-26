import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({super.key, required this.index, required this.onChangedTab});

  @override
  State<TabBarMaterialWidget> createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
    );

    return BottomAppBar(
      color: Colors.purple.shade100,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItems(
            index: 0,
            icon: const Icon(Icons.home)
          ),
          buildTabItems(
            index: 1,
            icon: const Icon(Icons.qr_code)
          ),
          placeholder,
          buildTabItems(
            index: 2,
            icon: const Icon(Icons.location_on)
          ),
          buildTabItems(
            index: 3,
            icon: const Icon(Icons.search)
          )
        ],
      ),
    );
  }

  Widget buildTabItems({required int index, required Icon icon}) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.orange : Colors.black
      ),
      child: IconButton(
        onPressed: () => widget.onChangedTab(index),
        icon: icon
      ),
    );
  }
}