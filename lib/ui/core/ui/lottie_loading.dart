import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyRtLoading extends StatelessWidget {
  const MyRtLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 140,
        width: 140,
        child: Lottie.asset('assets/loading_my_rt.json'),
      ),
    );
  }
}
