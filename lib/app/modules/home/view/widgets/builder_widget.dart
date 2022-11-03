import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/modules/home/view_model/home_provider.dart';
import 'package:git_app/app/modules/project/view/project_screen.dart';
import 'package:git_app/routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardbuilderWidget extends StatelessWidget {
  const CardbuilderWidget({Key? key, required this.height, required this.width})
      : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, val, _) {
      return SizedBox(
        width: width,
        height: height,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: val.itemList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Routes.nextScreen(
                      screen: ProjectScreen(
                    index: index,
                    image: val.itemList[index].owner!.avatarUrl.toString(),
                  )),
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
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                val.itemList[index].owner!.avatarUrl.toString(),
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                val.itemList[index].name.toString(),
                                style: AppTextStyles.h3.copyWith(
                                    color: AppColors.kBlack,
                                    letterSpacing: 1,
                                    wordSpacing: 1.5,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                val.itemList[index].description != null
                                    ? val.itemList[index].description.toString()
                                    : "No discription",
                                style: AppTextStyles.h3.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: AppColors.kGrey,
                                    fontSize: 13),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 120,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 108, 234, 113),
                                ),
                                child: Center(
                                  child: Text(
                                    val.itemList[index].language != null
                                        ? val.itemList[index].language
                                            .toString()
                                        : "No Language",
                                    style: AppTextStyles.h3.copyWith(
                                        color: const Color.fromARGB(
                                          255,
                                          95,
                                          130,
                                          97,
                                        ),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Total Stars: ${val.itemList[index].stargazersCount.toString()}⭐",
                                style: AppTextStyles.h3.copyWith(
                                    color: AppColors.kBlack, fontSize: 13),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "👁️${val.itemList[index].watchersCount!.toString().substring(2)}k",
                                      style: AppTextStyles.h3.copyWith(
                                          color: AppColors.kBlack,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      DateFormat('dd-MM-yyyy')
                                          .format(
                                              val.itemList[index].createdAt!)
                                          .toString(),
                                      style: AppTextStyles.h3.copyWith(
                                          color: AppColors.kBlack,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      val.itemList[index].defaultBranch != null
                                          ? val.itemList[index].defaultBranch
                                              .toString()
                                              .substring(14)
                                          : "No branch",
                                      style: AppTextStyles.h3.copyWith(
                                          color: AppColors.kBlack,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
