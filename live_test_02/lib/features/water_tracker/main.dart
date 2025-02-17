import 'package:flutter/material.dart';
import 'package:live_test_02/features/water_tracker/widgets/main.dart';
import 'package:live_test_02/utils/main.dart';
import 'package:live_test_02/widgets/main.dart';

class WaterTracker extends StatelessWidget {
  const WaterTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const TotalWaterCard(),
            const SizedBox(height: 30),
            const CircularProgress(),
            const SizedBox(height: 40),
            Button(
              text: "+ 100 ml",
              onPressed: () {},
              color: AppColors.primary,
              buttonBorderRadius: const BorderRadius.all(Radius.circular(4)),
              buttonTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 30),
            Button(
              text: "+ 200 ml",
              onPressed: () {},
              color: AppColors.primary,
              buttonBorderRadius: const BorderRadius.all(Radius.circular(4)),
              buttonTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 30),
            Button(
              text: "+ 300 ml",
              onPressed: () {},
              color: AppColors.primary,
              buttonBorderRadius: const BorderRadius.all(Radius.circular(4)),
              buttonTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 30),
          ])),
    );
  }
}
