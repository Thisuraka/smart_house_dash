import 'package:flutter/material.dart';
import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';

class DateFilterWidget extends StatefulWidget {
  final Function(DateTime startDate, DateTime endDate) selectedDates;

  const DateFilterWidget({super.key, required this.selectedDates});

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: () async {
          final pickedDates = await showDateRangePicker(
            context: context,
            firstDate: DateTime(2023),
            lastDate: DateTime(2024),
          );

          if (pickedDates != null) {
            widget.selectedDates(pickedDates.start, pickedDates.end);
          }
        },
        child: Container(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                AppString.pickStartEndDate,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
