import 'package:flutter/material.dart';

class TotalWaterCard extends StatelessWidget {
  const TotalWaterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          width: width * 0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1))
              ]),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Total Water", style: TextStyle(fontSize: 14.0)),
              SizedBox(height: 16),
              Text("100 ml", style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ],
    );
  }
}
