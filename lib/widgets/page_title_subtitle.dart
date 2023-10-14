import 'package:flutter/material.dart';

Widget pageTitleSubtitle({
  required BuildContext context,
  String? title,
  String? subtitle1,
  String? subtitle2,
  String? subtitle3,
  String? subtitle4,
}) {
  return LayoutBuilder(
    builder: (context, constraints) => SizedBox(
      width: constraints.maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          if (title != null && title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          if (subtitle1 != null && subtitle1.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                subtitle1,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          if (subtitle2 != null || subtitle3 != null || subtitle4 != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subtitle2 != null && subtitle2.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      subtitle2,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            overflow: TextOverflow.visible,
                          ),
                    ),
                  ),
                if (subtitle3 != null && subtitle3.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      subtitle3,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                if (subtitle4 != null && subtitle4.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      subtitle4,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
              ],
            ),
        ],
      ),
    ),
  );
}
