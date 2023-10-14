import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';

class DateRangeFilterWidget extends StatefulWidget {
  final DateTime? pickedStartDate;
  final DateTime? pickedEndDate;
  final Function(DateTime startDate, DateTime endDate) selectedDates;

  const DateRangeFilterWidget(
      {super.key, this.pickedStartDate, this.pickedEndDate, required this.selectedDates});

  @override
  State<DateRangeFilterWidget> createState() => _DateRangeFilterWidgetState();
}

class _DateRangeFilterWidgetState extends State<DateRangeFilterWidget> {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.pickedStartDate != null && widget.pickedEndDate != null
                    ? '${DateFormat('M/d/y').format(widget.pickedStartDate!)} -- ${DateFormat('M/d/y').format(widget.pickedEndDate!)}'
                    : AppString.pickStartEndDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
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
