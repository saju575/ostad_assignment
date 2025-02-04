import 'package:assignment_02/features/home/main.dart';
import 'package:assignment_02/styles/app_text_style.dart';
import 'package:assignment_02/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Contact List",
            style: AppTextStyles.appBarText.copyWith(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: const HomeFeature());
  }
}

class MyFeature extends StatelessWidget {
  const MyFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World");
  }
}
