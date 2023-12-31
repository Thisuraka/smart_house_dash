import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';

class DateFilterWidget extends StatefulWidget {
  final DateTime? pickedDate;
  final Function(DateTime pickedDate) selectedDates;

  const DateFilterWidget({super.key, this.pickedDate, required this.selectedDates});

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  DateTime selectedDate = DateTime.now(); // Set an initial date.

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2020),
            lastDate: DateTime(2101),
          );

          if (picked != null && picked != selectedDate) {
            widget.selectedDates(picked);
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
                widget.pickedDate != null
                    ? DateFormat('M/d/y').format(widget.pickedDate!)
                    : AppString.selectDate,
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
