import 'package:commerce/pages/homescreen_one.dart';
import 'package:commerce/pages/lets_continue.dart';
import 'package:commerce/providerz/cart_list.dart';
import 'package:commerce/providerz/e_user.dart';
import 'package:commerce/providerz/filtered_products.dart';
import 'package:commerce/providerz/product_list.dart';
import 'package:commerce/providerz/todo_filter.dart';
import 'package:commerce/providerz/todo_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<UserModelNotifier, UserModelState>(create: (_) => UserModelNotifier()),
        ChangeNotifierProvider<TodoFilter>(create: (context) =>  TodoFilter()),
        ChangeNotifierProvider<TodoSearch>(create: (context) => TodoSearch()),
        StateNotifierProvider<ProductList, ProductListState>(create: (context) => ProductList()),
        StateNotifierProvider<FilteredProducts, FilteredProductsState>(create: (context) => FilteredProducts()),
        StateNotifierProvider<AddtoCart, AddtoCartState>(create: (context) => AddtoCart()),
      ],
      child: GetMaterialApp(
        title: 'E-Commerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LetsContinue(),
      ),
    );
  }
}

