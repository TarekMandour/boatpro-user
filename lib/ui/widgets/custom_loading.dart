import 'package:bot_toast/bot_toast.dart';
import 'loading.dart';
import 'package:flutter/material.dart';

class CustomLoadWidget extends StatefulWidget {
  final CancelFunc? cancelFunc;

  const CustomLoadWidget({Key? key, this.cancelFunc}) : super(key: key);

  @override
  __CustomLoadWidgetState createState() => __CustomLoadWidgetState();
}

class __CustomLoadWidgetState extends State<CustomLoadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: CustomLoading(),
    );
  }
}
