import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/modules/home/view_model/home_provider.dart';
import 'package:git_app/routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key, required this.image, required this.index})
      : super(key: key);
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary1,
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.primary,
                      child: IconButton(
                        onPressed: () => Routes.backScreen(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.primary1,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.more_vert,
                        color: AppColors.primary1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomDetailsSheet(index),
          ],
        ),
      ),
    );
  }
}

Widget bottomDetailsSheet(int index1) {
  return DraggableScrollableSheet(
    initialChildSize: 0.5,
    minChildSize: 0.020,
    maxChildSize: .86,
    builder: (BuildContext context, ScrollController scrollController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(
                10,
              ),
            ),
            color: AppColors.primary,
          ),
          child: ListView(
            controller: scrollController,
            children: [
              ListTile(
                title: Text(
                  "Name",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kBlack, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().itemList[index1].name != null
                      ? context
                          .read<HomeNotifier>()
                          .itemList[index1]
                          .name
                          .toString()
                          .toUpperCase()
                      : "No Name",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kBlack, letterSpacing: 1),
                ),
              ),
              ListTile(
                title: Text(
                  "Description",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kBlack, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().itemList[index1].description !=
                          null
                      ? context
                          .read<HomeNotifier>()
                          .itemList[index1]
                          .description
                          .toString()
                      : "No Description",
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ExpansionTileWidget(
                index1: index1,
              ),
              ListTile(
                title: Text(
                  "Fork",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kBlack, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().itemList[index1].fork != null
                      ? context
                          .read<HomeNotifier>()
                          .itemList[index1]
                          .fork
                          .toString()
                      : "No forks",
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Watchers",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kBlack, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().itemList[index1].watchersCount !=
                          null
                      ? context
                          .read<HomeNotifier>()
                          .itemList[index1]
                          .watchersCount
                          .toString()
                      : "No watchers",
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Create at",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kBlack, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().itemList[index1].createdAt !=
                          null
                      ? DateFormat('dd-MM-yyyy')
                          .format(context
                              .read<HomeNotifier>()
                              .itemList[index1]
                              .createdAt!)
                          .toString()
                      : "No Date ",
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.kGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Homepage Url",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kBlack, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().itemList[index1].homepage !=
                              null &&
                          context
                              .read<HomeNotifier>()
                              .itemList[index1]
                              .homepage!
                              .isNotEmpty
                      ? context
                          .read<HomeNotifier>()
                          .itemList[index1]
                          .homepage
                          .toString()
                      : "No Homepage url",
                  style: AppTextStyles.h2.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Issues",
                  style: AppTextStyles.h3
                      .copyWith(color: AppColors.kBlack, letterSpacing: 1),
                ),
                subtitle: Text(
                  context.read<HomeNotifier>().itemList[index1].hasIssues !=
                          null
                      ? context
                          .read<HomeNotifier>()
                          .itemList[index1]
                          .hasIssues
                          .toString()
                      : "No issues",
                  style: AppTextStyles.h2.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    Key? key,
    required this.index1,
  }) : super(key: key);
  final int index1;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        backgroundColor: AppColors.primary1,
        trailing: const Icon(Icons.add),
        title: Text(
          "The Projects Includes",
          style: AppTextStyles.h2.copyWith(
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            color: AppColors.kBlack,
          ),
        ),
        children: [
          context.read<HomeNotifier>().itemList[index1].topics!.isEmpty ||
                  context.read<HomeNotifier>().itemList[index1].topics == null
              ? Text(
                  "No topics",
                  style: AppTextStyles.h3,
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisExtent: 30,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: context
                        .read<HomeNotifier>()
                        .itemList[index1]
                        .topics!
                        .length,
                    itemBuilder: (BuildContext ctx, index) {
                      final data =
                          context.read<HomeNotifier>().itemList[index1].topics;
                      return Text(
                        "👨‍💻  ${data![index].toString().toUpperCase()}",
                        style: AppTextStyles.h3.copyWith(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      );
                    },
                  ),
                ),
        ]);
  }
}
