import 'package:bloc_demo/bloc/products_bloc.dart';
import 'package:bloc_demo/repo/products_repo.dart';
import 'package:bloc_demo/screens/home_screen.dart';
import 'package:bloc_demo/services/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
     
    return BlocProvider(
     create: (context) => ProductsBloc(locator<ProductsRepo>()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
