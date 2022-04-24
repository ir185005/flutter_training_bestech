import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_training_bestech/colors.dart';
import 'package:flutter_training_bestech/video_info.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      setState(() {
        info = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Your program',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.homePageDetail,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: AppColor.homePageIcons,
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.gradientFirst.withOpacity(0.8),
                      AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 20,
                      color: AppColor.gradientSecond.withOpacity(0.2),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next workout',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Legs Toning \nand Glutes Workout',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: AppColor.homePageContainerTextSmall,
                          ),
                          Text(
                            ' 60 min',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColor.homePageContainerTextSmall,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.gradientFirst,
                                blurRadius: 15,
                                offset: Offset(4, 8),
                              )
                            ]),
                        child: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 5,
                bottom: 15,
              ),
              height: 140,
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/card.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            offset: Offset(8, 10),
                            color: AppColor.gradientSecond.withOpacity(0.3),
                          ),
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(-1, -5),
                            color: AppColor.gradientSecond.withOpacity(0.3),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 230,
                      bottom: 10,
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        //color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/figure.png'),
                          //fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(
                      left: 160,
                      top: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.homePageDetail,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Keep it up\nStick to your plan',
                            style: TextStyle(
                              color: AppColor.homePagePlanColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area of foucus',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: info.length.toDouble() ~/ 2,
                  itemBuilder: (_, i) {
                    int a = 2 * i;
                    int b = 2 * i + 1;
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 2,
                            height: 140,
                            padding: EdgeInsets.only(
                              bottom: 5,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(info[a]['img']),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5, 5),
                                    color: AppColor.gradientSecond.withOpacity(
                                      0.1,
                                    ),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5, -5),
                                    color: AppColor.gradientSecond.withOpacity(
                                      0.1,
                                    ),
                                  ),
                                ]),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 2,
                            height: 140,
                            padding: EdgeInsets.only(
                              bottom: 5,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(info[b]['img']),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5, 5),
                                    color: AppColor.gradientSecond.withOpacity(
                                      0.1,
                                    ),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5, -5),
                                    color: AppColor.gradientSecond.withOpacity(
                                      0.1,
                                    ),
                                  ),
                                ]),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
