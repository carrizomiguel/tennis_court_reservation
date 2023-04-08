import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class CourtPhotosPageView extends StatefulWidget {
  const CourtPhotosPageView({
    super.key,
    required this.photos,
  });

  final List<String> photos;

  @override
  State<CourtPhotosPageView> createState() => _CourtPhotosPageViewState();
}

class _CourtPhotosPageViewState extends State<CourtPhotosPageView> {
  final controller = PageController(viewportFraction: .9);
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
        Expanded(
          child: PageView.builder(
            controller: controller,
            clipBehavior: Clip.none,
            itemCount: widget.photos.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final photo = widget.photos[index];

              return PhotoContainer(
                photo: photo,
                isCurrentPage: currentPage == index,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        PageViewIndicator(
          length: widget.photos.length,
          currentPage: currentPage,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class PhotoContainer extends StatelessWidget {
  const PhotoContainer({
    super.key,
    required this.photo,
    required this.isCurrentPage,
  });

  final String photo;
  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(
        right: 10,
        top: isCurrentPage ? 0 : 30,
        bottom: isCurrentPage ? 0 : 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(photo),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.black26,
            BlendMode.darken,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          )
        ],
      ),
    );
  }
}
