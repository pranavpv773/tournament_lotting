import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/modules/home/view/widgets/builder_widget.dart';
import 'package:git_app/app/modules/home/view/widgets/shimmer.dart';
import 'package:git_app/app/modules/home/view_model/home_provider.dart';
import 'package:git_app/app/modules/login/view/widget/textform_widget.dart';
import 'package:git_app/app/modules/login/view_model/login_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: WillPopScope(
        onWillPop: context.watch<HomeNotifier>().onWillPop,
        child: NestedScrollView(
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
                              const Icon(
                                Icons.menu,
                                color: Colors.indigo,
                              ),
                              SizedBox(
                                height: height / 60,
                              ),
                              Text(
                                "Hello ${context.read<LoginNotifier>().userData[0].firstName.toUpperCase()}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.kGrey,
                                ),
                              ),
                              SizedBox(
                                height: height / 60,
                              ),
                              Text(
                                  textAlign: TextAlign.start,
                                  "Find the most stared repo\n and start code today.",
                                  style: AppTextStyles.h3.copyWith(
                                      color: AppColors.kBlack, fontSize: 20)),
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
                              children: [
                                // Icon(
                                //   Icons.align_vertical_center,
                                //   color: AppColors.kBlack,
                                // ),
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://mir-s3-cdn-cf.behance.net/projects/404/a17ff4145226633.Y3JvcCwxMTUwLDkwMCwxMjUsMA.png"),
                                  radius: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  child: const Icon(
                                    Icons.notifications_none_outlined,
                                  ),
                                ),
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
                      controller: context.read<HomeNotifier>().searchCntrl,
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
    ));
  }
}
