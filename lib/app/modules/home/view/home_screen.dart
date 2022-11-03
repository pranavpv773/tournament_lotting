import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/modules/home/view/widgets/builder_widget.dart';
import 'package:git_app/app/modules/home/view/widgets/shimmer.dart';
import 'package:git_app/app/modules/home/view_model/home_provider.dart';
import 'package:git_app/app/modules/login/view/widget/textform_widget.dart';
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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: false,
                pinned: true,
                snap: false,
                toolbarHeight: innerBoxIsScrolled ? 120 : 140,
                backgroundColor:
                    innerBoxIsScrolled ? AppColors.primary1 : AppColors.primary,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.menu,
                                color: AppColors.kBlack,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Hello Pranav",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.kBlack,
                                ),
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
                            width: width / 5.5,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                // Icon(
                                //   Icons.align_vertical_center,
                                //   color: AppColors.kBlack,
                                // ),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://mir-s3-cdn-cf.behance.net/projects/404/a17ff4145226633.Y3JvcCwxMTUwLDkwMCwxMjUsMA.png"),
                                  radius: 20,
                                ),
                                Icon(Icons.notifications),
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
                  child: FlexibleSpaceBar(
                    stretchModes: const [StretchMode.blurBackground],
                    centerTitle: true,
                    title: TextformsField(
                      title: "Search",
                      icon1: Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: Icon(
                          Icons.search,
                          color: AppColors.kPink,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: context.watch<HomeNotifier>().itemList.isEmpty
              ? const ShimmerBuilderWidget()
              : CardbuilderWidget(height: height, width: width),
        ),
      ),
    );
  }
}
