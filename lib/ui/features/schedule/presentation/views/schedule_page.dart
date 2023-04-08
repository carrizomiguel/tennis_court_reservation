import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  static Page<dynamic> page() {
    return const NoTransitionPage<void>(
      child: SchedulePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ScheduleBody();
  }
}

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      backgroundColor: kSecondaryColor,
      child: SafeArea(
        child: Column(
          children: [
            const ScheduleCustomAppBar(),
            SizedBox(height: Layout.setHeight(context, 2)),
            const BookAlert(),
            SizedBox(height: Layout.setHeight(context, 2)),
            BlocBuilder<ScheduleBloc, ScheduleState>(
              builder: (context, state) {
                switch (state.status) {
                  case ScheduleStatus.loading:
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          ShimmerLoading(
                            borderRadius: 20,
                            height: Layout.setHeight(context, 40),
                          ),
                          SizedBox(height: Layout.setHeight(context, 2)),
                          ShimmerLoading(
                            borderRadius: 20,
                            height: Layout.setHeight(context, 10),
                          ),
                        ],
                      ),
                    );
                  case ScheduleStatus.empty:
                    return const EmptySchedule();
                  case ScheduleStatus.success:
                    return SchedulePageView(
                      list: state.schedule,
                    );
                  case ScheduleStatus.error:
                    return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
