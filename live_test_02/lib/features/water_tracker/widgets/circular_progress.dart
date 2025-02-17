import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(alignment: Alignment.center, children: [
      SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: .4,
            color: Color(0xFF7AB2D3),
            strokeWidth: 6,
            backgroundColor: Color(0xFFDFF2EB),
            strokeCap: StrokeCap.round,
          )),
      Center(child: Text("100 %", style: TextStyle(fontSize: 20.0)))
    ]);
  }
}
