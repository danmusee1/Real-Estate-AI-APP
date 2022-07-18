import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rental_app/pages/home/tenants_landloard.dart';
import 'package:rental_app/pages/main/components/custom_bottom_bar.dart';
import 'package:rental_app/piechart/monthly_expenses_view.dart';
import 'package:rental_app/utils/colors.dart';
import 'package:rental_app/widgets/big_text.dart';
import 'package:rental_app/widgets/icon_and_text_widget.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import '../../widgets/small_text.dart';

class PropertiesPageBody extends StatefulWidget {
  PropertiesPageBody({Key? key}) : super(key: key);

  @override
  State<PropertiesPageBody> createState() => _PropertiesPageBodyState();
}

class _PropertiesPageBodyState extends State<PropertiesPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  double scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

//sliders number count implimentation
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          height: Dimensions.pageView,
          //color: Colors.redAccent,
          child: GestureDetector(
              onTap: () {
                Get.to(() => MontlyExpensesView());
              },
              child: PageView.builder(
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position);
                  })),
        ),
        //page dots section
        new DotsIndicator(
          dotsCount: 5,
          position: currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        //popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Properties"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: '"Active appartments"',
                ),
              )
            ],
          ),
        ),
        //list of food and images
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(children: [
                  //image section
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => MontlyExpensesView());
                      },
                    ),
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/house.png"),
                        )),
                  ),
                  //text container
                  InkWell(
                    child: Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Mlolongo-Syokimau"),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                SmallText(text: "100 units appartment"),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor1),
                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconColor: AppColors.mainColor),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor2),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(() => MontlyExpensesView());
                    },
                  )
                ]),
              );
            }),
      ],
    );
  }

  //zoom scalling aniation
  Widget _buildPageItem(int index) {
    //dart code for slide animation dealing with matrix
    Matrix4 matrix = new Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);

      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    }

//for the animationto work enclose container with transform with addition of transform property
    return Transform(
        transform: matrix,
        child: Stack(children: [
          Container(
            child: Container(
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                ),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color:
                          index.isEven ? Color(0xFF69c5df) : Color(0xFF9294c),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/house3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => MontlyExpensesView());
                  },
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: Dimensions.pageViewTextContainer,
                  margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height30,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                        //placing a shadow on a container
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, 0),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, 0),
                          ),
                        ],
                      ),
                      child: Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height15, left: 15, right: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: "Nairibi-Kitengela"),
                                SizedBox(height: Dimensions.height10),
                                //time and distance
                                Row(
                                  children: [
                                    Wrap(
                                        children: List.generate(
                                      5,
                                      (index) => Icon(Icons.star,
                                          color: AppColors.mainColor, size: 15),
                                    )),
                                    SizedBox(width: 10),
                                    SmallText(text: "4.5"),
                                    SizedBox(width: 10),
                                    SmallText(text: "1287"),
                                    SizedBox(width: 10),
                                    SmallText(text: "comments")
                                  ],
                                ),
                                SizedBox(height: Dimensions.height20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor1),
                                    IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconColor: AppColors.mainColor),
                                    IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: "Normal",
                                        iconColor: AppColors.iconColor2),
                                  ],
                                )
                              ])))))
        ]));
  }
}
