import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

class CalendarForm extends StatelessWidget {
  const CalendarForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CalendarView(),
          HourList(),
          const Spacer(),
          BlocBuilder<CalendarBloc, CalendarState>(
            builder: (context, state) {
              final date = state.schedule.date!;

              return WeatherCard(
                date: date,
              );
            },
          ),
          const Spacer(),
          const CalendarFormButton(),
        ],
      ),
    );
  }
}

class CalendarFormButton extends StatelessWidget {
  const CalendarFormButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleBloc, ScheduleState>(
      listener: (context, state) {
        if (state.status == ScheduleStatus.success) {
          context.go('/schedule');
        }
      },
      builder: (context, scheduleState) {
        final scheduleBloc = context.read<ScheduleBloc>();
        final isLoading = scheduleState.status == ScheduleStatus.loading;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: BlocSelector<CalendarBloc, CalendarState, ScheduleModel>(
            selector: (state) => state.schedule,
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  if (isLoading) return;
                  scheduleBloc.add(
                    ScheduleSaved(
                      schedule: state,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
              );
            },
          ),
        );
      },
    );
  }
}
