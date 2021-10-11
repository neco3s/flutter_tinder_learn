import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:flutter_tinder_learn/data/explore_json.dart';
import 'package:flutter_tinder_learn/data/icons.dart';
import 'package:flutter_tinder_learn/theme/colors.dart';
import 'package:flutter_tinder_learn/data/pages_json.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  late CardController controller;

  List itemsTemp = [];
  List pagesList = [];
  int itemLength = 0;
  int pageLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = explore_json;
      itemLength = explore_json.length;
      pagesList = pages_json;
      pageLength = pages_json.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // body: Image.asset("assets/images/tree.jpg"),
      body: getBody(),
      // body: Image.network(
      //   'https://1.bp.blogspot.com/-jlZlCg-8FAM/Xub_u8HTD1I/AAAAAAABZis/ZhUI05AZBEQpVinedZ6Xy-eIucmNuY2SQCNcBGAsYHQ/s1600/pose_pien_uruuru_man.png',
      // ),
      bottomSheet: getBottomSheet(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Container(
        height: size.height,
        child: TinderSwapCard(
          totalNum: pageLength,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 0.75,
          minWidth: MediaQuery.of(context).size.width * 0.75,
          minHeight: MediaQuery.of(context).size.height * 0.6,
          cardBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      // color: grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          // image: AssetImage(itemsTemp[index]['img']),
                          // image: NetworkImage(
                          //   "https://scrapbox.io/files/615c4de11f2553001d472de1.jpg",
                          // ),
                          // image: NetworkImage(pagesList[index]["image"]),
                          image: NetworkImage(
                            "https://1.bp.blogspot.com/-jlZlCg-8FAM/Xub_u8HTD1I/AAAAAAABZis/ZhUI05AZBEQpVinedZ6Xy-eIucmNuY2SQCNcBGAsYHQ/s1600/pose_pien_uruuru_man.png",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          black.withOpacity(0.25),
                          black.withOpacity(0),
                        ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.67,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          pagesList[index]['title'],
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          pagesList[index]["views"],
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    // Row(
                                    //   children: List.generate(
                                    //       pagesList[index]['likes'].length,
                                    //       (indexLikes) {
                                    //     if (indexLikes == 0) {
                                    //       return Padding(
                                    //         padding:
                                    //             const EdgeInsets.only(right: 8),
                                    //         child: Container(
                                    //           decoration: BoxDecoration(
                                    //               border: Border.all(
                                    //                   color: white, width: 2),
                                    //               borderRadius:
                                    //                   BorderRadius.circular(30),
                                    //               color:
                                    //                   white.withOpacity(0.4)),
                                    //           child: Padding(
                                    //             padding: const EdgeInsets.only(
                                    //                 top: 3,
                                    //                 bottom: 3,
                                    //                 left: 10,
                                    //                 right: 10),
                                    //             child: Text(
                                    //               pagesList[index]['likes']
                                    //                   [indexLikes],
                                    //               style:
                                    //                   TextStyle(color: white),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }
                                    //     return Padding(
                                    //       padding:
                                    //           const EdgeInsets.only(right: 8),
                                    //       child: Container(
                                    //         decoration: BoxDecoration(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(30),
                                    //             color: white.withOpacity(0.2)),
                                    //         child: Padding(
                                    //           padding: const EdgeInsets.only(
                                    //               top: 3,
                                    //               bottom: 3,
                                    //               left: 10,
                                    //               right: 10),
                                    //           child: Text(
                                    //             pagesList[index]['likes']
                                    //                 [indexLikes],
                                    //             style: TextStyle(color: white),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     );
                                    //   }),
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          cardController: controller = CardController(),
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //Card is RIGHT swiping
            }
            // print(pagesList.length);
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            /// Get orientation & index of swiped card!
            if (index == (pagesList.length - 1)) {
              setState(() {
                pageLength = pagesList.length - 1;
              });
            }
          },
        ),
      ),
    );
  }

  Widget getBottomSheet() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      decoration: BoxDecoration(color: white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Icon(
              Icons.settings,
              color: Colors.pink,
              size: 36.0,
            ),
            Icon(
              Icons.play_circle_outline_outlined,
              color: Colors.pink,
              size: 36.0,
            ),
            Icon(
              Icons.motion_photos_paused_outlined,
              color: Colors.pink,
              size: 36.0,
            ),
            Icon(
              Icons.sentiment_neutral_outlined,
              color: Colors.pink,
              size: 36.0,
            )
          ],
        ),
      ),
    );
  }
}

// motion_photos_paused_outlined
// play_circle_outline_outlined 
// sentiment_neutral_outlined 