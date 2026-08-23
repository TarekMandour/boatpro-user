import '../../index.dart';

class CustomNetworkImage extends StatelessWidget {
  final double borderRadius;
  final bool customRadius;
  final String image;
  final BorderRadiusGeometry? radius;
  const CustomNetworkImage({
    super.key,
    this.borderRadius = 12,
    this.customRadius = false,
    this.radius,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: customRadius
          ? radius ?? BorderRadius.zero
          : BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
          color: kcPrimaryColor,
        )),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/logo_single.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
