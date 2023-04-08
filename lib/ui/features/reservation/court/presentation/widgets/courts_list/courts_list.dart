import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class CourtsList extends StatelessWidget {
  const CourtsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: BlocBuilder<CourtBloc, CourtState>(
        builder: (context, state) {
          switch (state.status) {
            case CourtStatus.loading:
              return ShimmerLoading(
                borderRadius: 20,
                height: Layout.setHeight(context, 10),
              );
            case CourtStatus.success:
              final list = state.courts;

              return CourtListSection(list: list);
            case CourtStatus.error:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class CourtListSection extends StatelessWidget {
  const CourtListSection({
    super.key,
    required this.list,
  });

  final List<CourtModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Courts',
          style: TextStyle(
            fontSize: 30,
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: Layout.setHeight(context, 3)),
        ListView.separated(
          itemCount: list.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = list[index];

            return CourtItem(
              court: item,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
        ),
      ],
    );
  }
}
