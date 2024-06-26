import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MesmerizeWidget extends StatefulWidget {
  const MesmerizeWidget({super.key});

  @override
  State<MesmerizeWidget> createState() => _MesmerizeWidgetState();
}
const step =30.0;
class _MesmerizeWidgetState extends State<MesmerizeWidget> {

  late final Timer timer;
  double theta=0.0;
  double maxAngle =step;
  int counter=0;

  @override
  void initState() {
    super.initState();
    timer =Timer.periodic(const Duration(milliseconds: 25), (timer) {
      setState(() {
        theta +=0.01;
        maxAngle +=counter %10 ==0?step:0.0;
      });
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("mesmarized "),
      ),
      body: CustomPaint(
        painter: MesmarizePainter(theta,maxAngle ),
        child: Container(),
      ),
    );
  }
}

final bgPaint = Paint()
  ..color = Colors.black
  ..style = PaintingStyle.fill;

class MesmarizePainter extends CustomPainter {
   double theta;
   double maxAngle = 720.0;
  MesmarizePainter(this. theta,this.maxAngle);

  // final maxAngle = 720.0;
  // final step = 30.0;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(rect, bgPaint);
    final c = Offset(size.width / 2, size.height / 2);
    double r = size.width / 2;
    // drawCircle(canvas,c,r);
    for (double angle = 0.0; angle < maxAngle; angle += step) {
      drawCircle(canvas, c, r, angle,theta);
      r = r * 0.8;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawCircle(Canvas canvas, Offset c, double r, double angle, double theta) {
    final paint = Paint()
      ..color = const Color(0xFF4CC5F5)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(c, r, paint);
    final k = r * 2;
    final rect = Rect.fromCenter(center: Offset.zero, width: k * 0.8, height: k * 0.99);

    canvas.save();
    canvas.translate(c.dx, c.dy);
    canvas.rotate(angle * pi / 180 +theta);
    canvas.drawOval(rect, bgPaint);
    canvas.restore();
  }
}
