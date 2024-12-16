import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DropMenuExpanding extends StatefulWidget {
  const DropMenuExpanding({
    super.key,
    required this.isMenuIndex,
    required this.onIndexChange,
    required this.parentIcon,
    required this.parentName,
    required this.submenu, required this.index,
  });
  final bool isMenuIndex;
  final void Function(int index) onIndexChange;
  final IconData parentIcon;
  final String parentName;
  final List<Map<String, dynamic>> submenu;
  final int index;

  @override
  State<DropMenuExpanding> createState() => _DropMenuExpandingState();
}

class _DropMenuExpandingState extends State<DropMenuExpanding> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            widget.onIndexChange(widget.index);
            setState(() {
              isActive = !isActive;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: widget.isMenuIndex ? theme.colorScheme.surface : null,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Icon(widget.parentIcon),
              title: Text(widget.parentName),
              trailing: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isActive
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                ),
              ),
            ),
          ),
        ),
        if (isActive)
          Column(
            children: widget.submenu
                .map(
                  (item) => subMenu(item['icon'], item['title']),
                )
                .toList(),
          )
      ],
    );
  }
}

Widget subMenu(IconData icon, String name) {
  return IntrinsicHeight(
    child: Row(
      children: [
        const Gap(10),
        const VerticalDivider(),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  const Text("--"),
                  Expanded(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: Icon(icon),
                      title: Text(name),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
