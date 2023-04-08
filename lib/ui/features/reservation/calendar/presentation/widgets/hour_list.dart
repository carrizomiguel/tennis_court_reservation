import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class HourList extends StatelessWidget {
  HourList({super.key});

  final list = ScheduleModel.hours;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 40,
        ),
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return HourItem(
            hour: list[index],
          );
        },
      ),
    );
  }
}

class HourItem extends StatelessWidget {
  const HourItem({
    super.key,
    required this.hour,
  });

  final int hour;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CalendarBloc, CalendarState, DateTime>(
      selector: (state) => state.schedule.date!,
      builder: (context, state) {
        final calendarBloc = context.read<CalendarBloc>();
        final isDisabled = hour < state.hour;

        return GestureDetector(
          onTap: () {
            if (isDisabled) return;
            calendarBloc.add(
              CalendarHourSelected(
                hour: hour,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isDisabled ? Colors.grey.shade200 : kAccentOpacity,
              borderRadius: BorderRadius.circular(5),
              border: hour == state.hour
                  ? Border.all(
                      color: kAccentColor,
                      width: 2,
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                '${hour < 10 ? '0' : ''}$hour:00',
                style: TextStyle(
                  fontSize: 17,
                  color: isDisabled ? Colors.grey : kAccentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
