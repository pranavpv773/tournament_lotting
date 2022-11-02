import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        toolbarHeight: height / 3.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.menu, color: AppColors.kBlack),
                SizedBox(
                  height: height / 30,
                ),
                Text(
                  "Hello Pranav",
                  style: TextStyle(fontSize: 16, color: AppColors.kBlack),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Text(
                  textAlign: TextAlign.start,
                  "Find the most stared repo\n and start code today.",
                  style: TextStyle(fontSize: 18, color: AppColors.kBlack),
                ),
              ],
            ),
            Container(
              width: width / 4,
              height: height / 5,
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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: height,
          width: width,
          child: Consumer<HomeNotifier>(builder: (context, val, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Most Stared Repository"),
                ListTile(
                  title: Text(
                    val.itemList[0].name.toString(),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
