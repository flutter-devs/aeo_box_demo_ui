import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
  final double progress;

  const CustomProgressBar({Key? key, required this.progress}) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: _progress,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }
}
