import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return BlocSelector<CalendarBloc, CalendarState, DateTime>(
      selector: (state) => state.schedule.date!,
      builder: (context, state) {
        final calendarBloc = context.read<CalendarBloc>();

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: TableCalendar<DateTime>(
            focusedDay: state,
            firstDay: DateTime.now().add(
              Duration(days: now.hour > 20 ? 1 : 0),
            ),
            lastDay: state.add(
              const Duration(days: 5),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              calendarBloc.add(CalendarDateChanged(date: selectedDay));
            },
            selectedDayPredicate: (day) {
              final date = DateTime(
                state.year,
                state.month,
                state.day - 1,
                19,
              );
              return day == date.toUtc();
            },
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              headerMargin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: kAccentOpacity,
                borderRadius: BorderRadius.circular(10),
              ),
              leftChevronIcon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: kAccentColor,
                size: 17,
              ),
              rightChevronIcon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: kAccentColor,
                size: 17,
              ),
              headerPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 3,
              ),
            ),
            daysOfWeekHeight: 30,
            rowHeight: 35,
            calendarBuilders: CalendarBuilders(
              headerTitleBuilder: (context, day) {
                return Text(
                  '${DateFormat.MMMM().format(day)} ${day.year}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    color: kAccentColor,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
              dowBuilder: (context, day) {
                return Text(
                  DateFormat.E().format(day).substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade400,
                  ),
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                return SelectedDate(
                  focusedDay: focusedDay,
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 4),
                    SizedBox(
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: kAccentColor,
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class SelectedDate extends StatelessWidget {
  const SelectedDate({
    super.key,
    required this.focusedDay,
  });

  final DateTime focusedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 2,
              color: kAccentColor,
            ),
          ),
          child: Center(
            child: Text(
              focusedDay.day.toString(),
              style: const TextStyle(
                fontSize: 15,
                color: kAccentColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
