import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tournament_lotter/turf_app/core/styles/colors/colors.dart';

class TLoginScreen extends StatelessWidget {
  const TLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Turfcolors.kGreen,
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Container(
            decoration: BoxDecoration(
              color: Turfcolors.kGrey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
            ),
            width: 500.w,
            height: 100.h,
            child: Column(
              children: const [],
            ),
          ),
        ],
      ),
    );
  }
}
