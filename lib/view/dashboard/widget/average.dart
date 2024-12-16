import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Average extends StatelessWidget {
  const Average({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: card(
                  "Daily Average",
                  "₹2,845",
                  theme,
                ),
              ),
              const Gap(5),
              const VerticalDivider(),
              const Gap(5),
              Expanded(
                child: card(
                  "Monthly Growth",
                  "18.2%",
                  theme,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget card(String title, String value, ThemeData theme) {
  return Flex(
    direction: Axis.vertical,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        value,
        style: theme.textTheme.titleLarge!.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  );
}
