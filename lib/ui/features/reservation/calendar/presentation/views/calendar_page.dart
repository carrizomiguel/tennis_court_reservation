import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({
    super.key,
    required this.courtId,
  });

  final int courtId;

  static Page<dynamic> page(int courtId) {
    return MaterialPage<void>(
      child: CalendarPage(
        courtId: courtId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final courtBloc = context.read<CourtBloc>();
    final list = courtBloc.state.courts;
    final court = list.firstWhere(
      (e) => e.id == courtId,
    );

    return BlocProvider(
      lazy: false,
      create: (context) => CalendarBloc()
        ..add(CalendarInitialized())
        ..add(CalendarCourtSelected(court: court)),
      child: const CalendarBody(),
    );
  }
}

class CalendarBody extends StatelessWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        switch (state.status) {
          case CalendarStatus.loading:
            return const Material(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  color: kAccentColor,
                ),
              ),
            );
          case CalendarStatus.success:
            return Material(
              color: kAccentColor,
              child: Stack(
                children: const [
                  CalendarCustomAppBar(),
                  Positioned.fill(
                    top: 100,
                    child: CalendarForm(),
                  ),
                ],
              ),
            );
          case CalendarStatus.error:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
