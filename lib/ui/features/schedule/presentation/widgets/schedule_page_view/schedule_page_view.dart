import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class SchedulePageView extends StatefulWidget {
  const SchedulePageView({
    super.key,
    required this.list,
  });

  final List<ScheduleModel> list;

  @override
  State<SchedulePageView> createState() => _SchedulePageViewState();
}

class _SchedulePageViewState extends State<SchedulePageView> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.page?.round() != currentPage) {
        setState(() {
          currentPage = controller.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Layout.setHeight(context, 60),
          child: PageView.builder(
            controller: controller,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              final item = widget.list[index];

              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    height: Layout.setHeight(context, 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: kShadowColor.withAlpha(20),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: Layout.setHeight(context, 20),
                          child: Image.network(
                            item.court.thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      item.court.name,
                                      style: const TextStyle(
                                        fontSize: 35,
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    ScheduleCourtRating(
                                      rating: item.court.stars,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Text(
                                  'Your reservation:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: kSecondaryColor,
                                  ),
                                ),
                                Text(
                                  DateFormat('EEE, MMM d, yyyy h:mm a').format(
                                    item.date!,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: kSecondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Layout.setHeight(context, 2)),
                  const WeatherCard(),
                ],
              );
            },
          ),
        ),
        PageViewIndicator(
          length: widget.list.length,
          currentPage: currentPage,
        ),
      ],
    );
  }
}
