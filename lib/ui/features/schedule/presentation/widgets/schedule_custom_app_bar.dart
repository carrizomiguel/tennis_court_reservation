import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_booking/ui/app/app.dart';

class ScheduleCustomAppBar extends StatelessWidget {
  const ScheduleCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    final user = appBloc.state.user;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 25,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Your schedule',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Here are your reservations.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const Spacer(),
          CircleAvatar(
            child: Image.network(
              user.avatarUrl,
            ),
          )
        ],
      ),
    );
  }
}
