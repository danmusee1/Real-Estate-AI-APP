import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/piechart/monthly_expenses_view.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // ignore: unnecessary_new
          new Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/house3.png"),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  // SliverToBoxAdapter(
  // child: Text(
  //     " hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the hello dinmki nkjkj jjjk i love you in the"),
}
