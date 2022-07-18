import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_app/pages/auth/register_page.dart';
import 'package:rental_app/pages/auth/welcome_back_page.dart';
import 'package:rental_app/pages/home/category_list_page.dart';
import 'package:rental_app/pages/home/custom_bottom_bar.dart';
import 'package:rental_app/pages/home/main_food_page.dart';
import 'package:rental_app/pages/home/properties_page.dart';
import 'package:rental_app/pages/home/tenants_landloard.dart';
import 'package:rental_app/pages/main/main_page.dart';
import 'package:rental_app/pages/rating/rating_dialog.dart';
import 'package:rental_app/pages/home/select_card.dart';
import 'package:rental_app/pages/request_money/receive_page.dart';
import 'package:rental_app/pages/request_money/request_amount_page.dart';
import 'package:rental_app/pages/request_money/request_page.dart';
import 'package:rental_app/pages/search_page.dart';
import 'package:rental_app/pages/send_money/quick_send_amount_page.dart';
import 'package:rental_app/pages/send_money/send_page.dart';
import 'package:rental_app/pages/wallet/wallet_page.dart';
import 'package:rental_app/piechart/monthly_expenses_view.dart';
import 'package:rental_app/products/components/more_products.dart';
import 'package:rental_app/products/components/product_card.dart';
import 'package:rental_app/products/components/product_display.dart';
import 'package:rental_app/products/components/product_options.dart';
import 'package:rental_app/products/components/rating_bottomSheet.dart';
import 'package:rental_app/products/components/shop_bottomSheet.dart';
import 'package:rental_app/products/components/shop_product.dart';
import 'package:rental_app/products/product_page.dart';
import 'package:rental_app/products/view_product_page.dart';
import 'package:rental_app/tenants/chat_page/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
