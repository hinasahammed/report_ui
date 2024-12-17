import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:report_ui/model/sub_menu_items.dart';

class DropMenuExpanding extends StatefulWidget {
  const DropMenuExpanding({
    super.key,
    required this.isMenuIndex,
    required this.onIndexChange,
    required this.parentIcon,
    required this.parentName,
    required this.submenu,
    required this.index,
  });
  final bool isMenuIndex;
  final void Function(int index) onIndexChange;
  final String parentIcon;
  final String parentName;
  final List<SubMenuItems> submenu;
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
          borderRadius: BorderRadius.circular(15),
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
              leading: Image.asset(
                widget.parentIcon,
                width: 25,
                height: 25,
              ),
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
                  (subMenuItems) =>
                      subMenu(subMenuItems.icon, subMenuItems.title),
                )
                .toList(),
          )
      ],
    );
  }
}

Widget subMenu(String icon, String name) {
  return IntrinsicHeight(
    child: Row(
      children: [
        const Gap(10),
        const VerticalDivider(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("--"),
              Expanded(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Image.asset(
                    icon,
                    width: 25,
                    height: 25,
                  ),
                  title: Text(name),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
