import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_app/pages/home/category_list_page.dart';
import 'package:rental_app/pages/home/tenants_landloard.dart';
import 'package:rental_app/pages/main/components/custom_bottom_bar.dart';
import 'package:rental_app/pages/main/components/tab_view.dart';
import 'package:rental_app/pages/notifications_page.dart';
import 'package:rental_app/pages/payment/unpaid_page.dart';
import 'package:rental_app/pages/profile_page.dart';
import 'package:rental_app/pages/search_page.dart';
import 'package:rental_app/pages/shop/check_out_page.dart';
import 'package:rental_app/pages/wallet/wallet_page.dart';
import 'package:rental_app/piechart/categories_row.dart';
import 'package:rental_app/piechart/pie_chart_view.dart';
import 'package:rental_app/utils/colors.dart';
import 'package:rental_app/utils/dimensions.dart';

class MontlyExpensesView extends StatefulWidget {
  _MontlyExpensesViewState createState() => _MontlyExpensesViewState();
}

class _MontlyExpensesViewState extends State<MontlyExpensesView>
    with TickerProviderStateMixin<MontlyExpensesView> {
  late TabController tabController;
  late TabController bottomTabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
  }

  Widget tabBar = TabBar(
    tabs: [
      Tab(text: 'Trending'),
      Tab(text: 'Sports'),
      Tab(text: 'Headsets'),
      Tab(text: 'Wireless'),
      Tab(text: 'Bluetooth'),
    ],
    labelStyle: TextStyle(fontSize: 16.0),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.0,
    ),
    labelColor: darkGrey,
    unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
    isScrollable: true,
  );
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(193, 214, 233, 1),
      body: Stack(children: [
        //  SliverToBoxAdapter(
        //   child: tabBar,
        // ),

        //background image
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: Dimensions.popularFoodImgSize,
            decoration: const BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/house3.png"))),
          ),
        ),

        Positioned(
          left: 20.0,
          bottom: 0.0,
          child: RawMaterialButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => RatingPage())),
            constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
            child:
                Icon(Icons.favorite, color: Color.fromRGBO(255, 137, 147, 1)),
            elevation: 0.0,
            shape: CircleBorder(),
            fillColor: Color.fromRGBO(255, 255, 255, 0.4),
          ),
        ),
        Container(
          height: kToolbarHeight + MediaQuery.of(context).padding.top,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NotificationsPage())),
                  icon: Icon(Icons.notifications)),
              IconButton(
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchPage())),
                  icon: SvgPicture.asset('assets/icons/search_icon.svg'))
            ],
          ),
        ),
        //center page navigations
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          new GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => RatingPage())),
              child: Container(
                height: 50,
                child: Center(
                  child: Text("Tenants"),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 119, 160, 7),
                  border: Border.all(width: 3, color: Colors.yellow),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                ),
              )),
          new GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => WalletPage())),
              child: Container(
                height: 50,
                child: Center(
                  child: Text("Accounts"),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 245, 171, 12),
                  border: Border.all(
                      width: 3, color: Color.fromARGB(255, 2, 17, 102)),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                ),
              )),
          new GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => UnpaidPage())),
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(top: 6.0),
                child: Center(child: Text("Print Overview")),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 141, 162, 180),
                  border: Border.all(
                      width: 3, color: Color.fromARGB(255, 193, 214, 233)),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                ),
              ))
        ]),
        Column(
          children: <Widget>[
            Spacer(),
            SizedBox(
              height: height * 0.43,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: height * 0.065),
                    Text(
                      'Monthly Expenses',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          CategoriesRow(),
                          PieChartView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
