import 'package:flutter/material.dart';

class MenuItemsCard extends StatelessWidget {
  const MenuItemsCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    required this.isMenuIndex,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;
  final bool isMenuIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isMenuIndex ? theme.colorScheme.surface : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Icon(
            icon,
          ),
          title: Text(title),
        ),
      ),
    );
  }
}
