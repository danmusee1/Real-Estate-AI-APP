import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/pages/home/category_list_page.dart';
import 'package:rental_app/pages/main/components/custom_bottom_bar.dart';
import 'package:rental_app/pages/main/components/tab_view.dart';
import 'package:rental_app/pages/profile_page.dart';
import 'package:rental_app/pages/search_page.dart';
import 'package:rental_app/pages/shop/check_out_page.dart';
import 'package:rental_app/piechart/monthly_expenses_view.dart';
import 'package:rental_app/utils/colors.dart';
import 'package:rental_app/pages/home/properties_page.dart';
import 'package:rental_app/widgets/big_text.dart';
import 'package:rental_app/widgets/custom_background.dart';
import 'package:rental_app/widgets/small_text.dart';

import '../../utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage>
    with TickerProviderStateMixin<MainFoodPage> {
  late TabController bottomTabController;
  @override
  void initState() {
    super.initState();

    bottomTabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      //starts here

      //ends here
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        //starts here

        //TabBarView(
         // controller: bottomTabController,
        //  physics: NeverScrollableScrollPhysics(),
        //  children: <Widget>[
       //     CategoryListPage(),
         //   CheckOutPage(),
         //   ProfilePage(),
         //   MontlyExpensesView(),
        //  ],
       // ),
        //ends here

        //showing the header
        Container(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        BigText(
                          text: "Rental- app",
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Nairobi",
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      child: Center(
                        child: Container(
                          width: Dimensions.height45,
                          height: Dimensions.height45,
                          child: Icon(Icons.search,
                              color: Colors.white, size: Dimensions.iconSize24),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SearchPage())),
                    )
                  ],
                ))),

        //showing the body
        // Container(
        // height: MediaQuery.of(context).size.height,
        //child: SingleChildScrollView(
        // child: PropertiesPageBody(),
        //),
        //)
        Expanded(
          child: SingleChildScrollView(
            child: PropertiesPageBody(),
          ),
        )
      ]),
      //statts here

      //ends here
    );
  }
}
