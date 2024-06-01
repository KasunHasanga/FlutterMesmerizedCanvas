
import 'package:flutter/material.dart';

class MesmerizeWidget extends StatefulWidget {
  const MesmerizeWidget({super.key});

  @override
  State<MesmerizeWidget> createState() => _MesmerizeWidgetState();
}

class _MesmerizeWidgetState extends State<MesmerizeWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("mesmarized "),
      ),
      body: CustomPaint(
        child: Container(),

      ),
    );
  }
}
