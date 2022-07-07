import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import 'package:shop_app/providers/cart_provider.dart';
import '../providers/product_provider.dart';

import '../pages/product_overview_page.dart';
import 'app_routes.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.deepOrange,
            primary: Colors.purple,
          ),
          fontFamily: 'Lato',
        ),
        initialRoute: AppRoutes.productOverview,
        routes: {
          AppRoutes.productOverview: (_) => ProductOverviewPage(),
          AppRoutes.productDetail: (_) => ProductDetailPage(),
          AppRoutes.cart: (_) => CartPage(),
        },
      ),
    );
  }
}
