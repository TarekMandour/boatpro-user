// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart' as carousel;

import '../../index.dart';

class Banners extends StatefulWidget {
  final List<String> items;
  final int dividedBy;
  final bool isScroll;
  final bool fullscreen;
  final BorderRadiusGeometry? radius;

  const Banners({
    Key? key,
    required this.items,
    required this.dividedBy,
    this.isScroll = true,
    this.fullscreen = false,
    this.radius,
  }) : super(key: key);

  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int _current = 0;
  final carousel.CarouselSliderController _controller =
      carousel.CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        carousel.CarouselSlider(
          items: widget.items.map((element) {
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: widget.fullscreen ? 0 : 3),
              width: double.infinity,
              height: double.infinity,
              child: CustomNetworkImage(
                image: element,
                customRadius: widget.fullscreen,
                radius: widget.radius,
              ),
            );
          }).toList(),
          options: carousel.CarouselOptions(
            height: screenHeightFraction(context, dividedBy: widget.dividedBy),
            autoPlay: true,
            enableInfiniteScroll: false,
            aspectRatio: 1.0,
            viewportFraction: widget.fullscreen ? 1 : 0.8,
            scrollPhysics: widget.isScroll
                ? const PageScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        if (widget.items.length > 1)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: kcTextBlackColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: kcWhiteColor, width: 2)),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.items.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: _current == entry.key ? 15 : 5.0,
                            height: 5.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(100),
                              color: _current == entry.key
                                  ? kcPrimaryColor
                                  : kcBackgroundColor,
                            ),
                          ),
                        );
                      }).toList()),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
