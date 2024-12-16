import 'package:flutter/material.dart';

class RecentTransaction extends StatelessWidget {
  const RecentTransaction(
      {super.key,
      required this.title,
      required this.time,
      required this.price});
  final String title;
  final String time;
  final String price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: [
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              time,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(.8),
              ),
            ),
          ],
        ),
        Text(
          price,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
