import 'package:flutter/material.dart';

import '../widgets/app_text.dart';
import 'explore_more_pages/ballooning_page.dart';
import 'explore_more_pages/hiking_page.dart';
import 'explore_more_pages/kayaking_page.dart';
import 'explore_more_pages/snorkling_page.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({super.key});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  var images = {
    "balloning.png": "Ballooning",
    "hiking.png": "Hiking",
    "snorkling.png": "Snorkling",
    "kayaking.png": "Kayaking"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
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
                      margin: EdgeInsets.only(right: 60,top: 50),
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
            ),
          ],
        ),
    );
  }
}
