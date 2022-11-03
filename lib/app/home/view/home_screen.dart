import 'dart:math';
import 'package:git_app/app/home/view/widgets/shimmer.dart';
import 'package:git_app/app/login/view/widget/textform_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    floating: false,
                    pinned: true,
                    snap: false,
                    toolbarHeight: innerBoxIsScrolled ? 120 : 140,
                    backgroundColor: innerBoxIsScrolled
                        ? AppColors.primary1
                        : AppColors.primary,
                    automaticallyImplyLeading: false,
                    expandedHeight: 140,
                    title: Visibility(
                      visible: innerBoxIsScrolled == false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.menu, color: AppColors.kBlack),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Hello Pranav",
                                    style: TextStyle(
                                        fontSize: 16, color: AppColors.kBlack),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    "Find the most stared repo\n and start code today.",
                                    style: TextStyle(
                                        fontSize: 18, color: AppColors.kBlack),
                                  ),
                                ],
                              ),
                              Container(
                                width: width / 4,
                                height: height / 6,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/gradient.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // Icon(
                                    //   Icons.align_vertical_center,
                                    //   color: AppColors.kBlack,
                                    // ),
                                    CircleAvatar(
                                      radius: 20,
                                      child: Image.network(
                                          "https://mir-s3-cdn-cf.behance.net/projects/404/a17ff4145226633.Y3JvcCwxMTUwLDkwMCwxMjUsMA.png"),
                                    ),
                                    const Icon(Icons.notifications),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    flexibleSpace: Visibility(
                      visible: innerBoxIsScrolled,
                      child: const FlexibleSpaceBar(
                        stretchModes: [StretchMode.blurBackground],
                        centerTitle: true,
                        title:
                            TextformsField(title: "Search", icon: Icons.search),
                      ),
                    )

                    // expandedHeight: 120.0,
                    )
              ];
            },
            body: context.watch<HomeNotifier>().itemList.isEmpty
                ? const ShimmerBuilderWidget()
                : Consumer<HomeNotifier>(builder: (context, val, _) {
                    return SizedBox(
                      width: width,
                      height: height,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: val.itemList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 10,
                                shadowColor: AppColors.primary1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 120,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            val.itemList[index].owner!.avatarUrl
                                                .toString(),
                                          ),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            val.itemList[index].name.toString(),
                                            style: AppTextStyles.h3.copyWith(
                                                color: AppColors.kBlack,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            val.itemList[index].description
                                                .toString(),
                                            style: AppTextStyles.h3.copyWith(
                                                color: AppColors.kBlack,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            val.itemList[index].language
                                                .toString(),
                                            style: AppTextStyles.h3.copyWith(
                                                color: AppColors.kBlack,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            val.itemList[index].stargazersCount
                                                .toString(),
                                            style: AppTextStyles.h3.copyWith(
                                                color: AppColors.kBlack,
                                                fontSize: 13),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                (log(val.itemList[index].size!
                                                            .toInt()) /
                                                        log(1024))
                                                    .floor()
                                                    .toString(),
                                                style: AppTextStyles.h3
                                                    .copyWith(
                                                        color: AppColors.kBlack,
                                                        fontSize: 13),
                                              ),
                                              Text(
                                                DateFormat('dd-MM-yyyy')
                                                    .format(val.itemList[index]
                                                        .createdAt!)
                                                    .toString(),
                                                style: AppTextStyles.h3
                                                    .copyWith(
                                                        color: AppColors.kBlack,
                                                        fontSize: 13),
                                              ),
                                              Text(
                                                val.itemList[index]
                                                    .defaultBranch
                                                    .toString(),
                                                style: AppTextStyles.h3
                                                    .copyWith(
                                                        color: AppColors.kBlack,
                                                        fontSize: 13),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  })),
      ),
    );
  }
}
