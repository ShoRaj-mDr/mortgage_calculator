import 'dart:math';
import 'package:flutter/material.dart';

//Create CircleProgress Widget that will be used on the Montly Payment Screen
class CircleProgressBar extends StatefulWidget {
  final double? totalPayment;

  const CircleProgressBar({Key? key, required this.totalPayment})
      : super(key: key);
  @override
  State<CircleProgressBar> createState() => _CircleProgressBarState();
}

class _CircleProgressBarState extends State<CircleProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController progressController;
  late Animation animation;
  late double payment;

  @override
  void initState() {
    super.initState();
    payment = widget.totalPayment!;
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 11000));
    animation = Tween<double>(begin: 0, end: 0.9).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CustomPaint(
            foregroundPainter: CircleProgress(),
            child: Container(
              height: 250,
              width: 250,
              alignment: Alignment.center,
              child: Text(
                "\$ " + widget.totalPayment.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CircleProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var strokeWidth = 12.0;

    Paint outerCircle = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.purple
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //Other Arcs

    Paint hoaArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint ptArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint hiArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //Additional logic that draws Arcs
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 7;

    canvas.drawCircle(center, radius, outerCircle);
    double angle = 2 * pi * (90 / 100);
    double hoaAngle = 2 * pi * (30 / 100);
    double ptAngle = 2 * pi * (20 / 100);
    double hiAngle = 2 * pi * (10 / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        hoaAngle, false, hoaArc);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        ptAngle, false, ptArc);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        hiAngle, false, hiArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
