import 'package:flutter/material.dart';
import 'package:live_test_02/features/water_tracker/main.dart';

class WaterTrackerScreen extends StatelessWidget {
  const WaterTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFDF0),
        appBar: AppBar(
          title: const Text("Water Tracker"),
          centerTitle: true,
          actions: [
            ThreeDotMenu(
              onAction: (value) {
                if (value == 1) {}
              },
              menuItems: [
                MenuItem(
                    value: 1,
                    label: "Set New Goal",
                    icon: const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.teal,
                    )),
              ],
            )
          ],
        ),
        body: const WaterTracker());
  }
}

class ThreeDotMenu extends StatelessWidget {
  final void Function(int) onAction;
  final Icon? icon;
  final List<MenuItem> menuItems;

  const ThreeDotMenu({
    super.key,
    required this.onAction,
    this.icon,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      //   icon: icon ?? const Icon(Icons.more_vert),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Colors.white,
      offset: const Offset(-16, 40),

      itemBuilder: (context) => menuItems
          .map(
            (item) => PopupMenuItem<int>(
              value: item.value,
              child: Row(
                children: [
                  if (item.icon != null) ...[
                    item.icon!,
                    const SizedBox(width: 10),
                  ],
                  Text(
                    item.label,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.teal),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      onSelected: onAction,
    );
  }
}

class MenuItem {
  final int value;
  final String label;
  final Icon? icon;

  MenuItem({required this.value, required this.label, this.icon});
}
