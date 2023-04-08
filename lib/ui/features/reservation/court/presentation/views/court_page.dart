import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class CourtPage extends StatelessWidget {
  const CourtPage({
    super.key,
    required this.courtId,
  });

  final int courtId;

  static Page<dynamic> page(int courtId) {
    return MaterialPage<void>(
      child: CourtPage(
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

    return CourtBody(
      court: court,
    );
  }
}

class CourtBody extends StatelessWidget {
  const CourtBody({
    super.key,
    required this.court,
  });

  final CourtModel court;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          CourtPhotosSlider(
            court: court,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Text(
                'Description',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                court.description,
                style: const TextStyle(
                  color: kSecondaryColor,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
