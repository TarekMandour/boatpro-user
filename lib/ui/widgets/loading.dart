import 'package:loading_indicator/loading_indicator.dart';
import '../index.dart';

// ignore: must_be_immutable
class CustomLoading extends StatelessWidget {
  CustomLoading(
      {Key? key,
      this.width = 80,
      this.height = 80,
      this.color = kcPrimaryColor})
      : super(key: key);
  double width;
  double height;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: LoadingIndicator(
          indicatorType: Indicator.ballClipRotatePulse,
          colors: [color, color],
        ),
      ),
    );
  }
}
