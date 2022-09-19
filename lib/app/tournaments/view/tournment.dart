import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Select Tournament"),
          ),
          body: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: const [
                    CardWidget(
                      image:
                          'https://www.nicepng.com/png/detail/257-2570111_cricket-equipment-gear-cricket-png.png',
                      sports: 'Cricket',
                      count: 5,
                      avathar: 'avathar1',
                    ),
                    CardWidget(
                      image:
                          'https://m.media-amazon.com/images/I/71ufAwE1xnL._SL1500_.jpg',
                      sports: 'Carroms',
                      count: 5,
                      avathar: 'avathar2',
                    ),
                    CardWidget(
                      image:
                          'https://img.freepik.com/premium-vector/soccer-football-logo-vector_7888-111.jpg?w=2000',
                      sports: 'Football',
                      count: 5,
                      avathar: 'avathar3',
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.count,
    required this.image,
    required this.avathar,
    required this.sports,
  }) : super(key: key);
  final String sports;
  final int count;
  final String image;
  final String avathar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Material(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  elevation: 10,
                  child: Container(
                    height: constraints.maxHeight * 0.8,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 25,
                child: Hero(
                  tag: avathar,
                  child: CircleAvatar(
                    backgroundColor: kWhite,
                    radius: 80,
                    backgroundImage: NetworkImage(image),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 100,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      sports,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Nunito',
                        color: kWhite,
                      ),
                    ),
                    Text(
                      "Total Tournaments: $count",
                      style: TextStyle(
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
