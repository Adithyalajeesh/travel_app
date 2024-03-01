import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app-cubits.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/see_all_page.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import 'explore_more_pages/ballooning_page.dart';
import 'explore_more_pages/hiking_page.dart';
import 'explore_more_pages/kayaking_page.dart';
import 'explore_more_pages/snorkling_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Ballooning",
    "hiking.png": "Hiking",
    "snorkling.png": "Snorkling",
    "kayaking.png": "Kayaking"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.buttonBackground,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket),label: "Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",)
          
        ],
      ),
        body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu
              Container(
                padding: EdgeInsets.only(top: 50, left: 18),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black54,
                      size: 30,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //discover text
              Container(
                margin: EdgeInsets.only(left: 20),
                child: AppLargeText(
                  text: 'Discover',
                ),
              ),
              //tab bar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black54,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        text: "Places",
                      ),
                      Tab(
                        text: "Inspirations",
                      ),
                      Tab(
                        text: "Emotions",
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  height: 250,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          if (state is LoadedState) {
                            return Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage('assets/mountain.jpeg'),
                                      fit: BoxFit.cover)),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      Text('There'),
                      Text('byyee'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore more",
                      size: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeeAllPage(),
                          ),
                        );

                      },
                      child: AppText(
                        text: "See all",
                        color: AppColors.textColor1,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 86,
                margin: EdgeInsets.only(left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images
                      .length,
                  itemBuilder: (_, index) {
                    String imageName = images.keys.elementAt(index);
                    String imageLabel = images.values.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        // Perform navigation based on index
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BallooningPage(),
                              ),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HikingPage(),
                              ),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SnorklingPage(),
                              ),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KayakingPage(),
                              ),
                            );
                            break;
                          default:
                            break;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 60),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/$imageName'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              child: AppText(text: imageLabel),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width / 2 - radius,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
    // TODO: implement paint
  }
}
