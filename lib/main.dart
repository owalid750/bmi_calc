import 'package:bmi_cal/bmi_cubit/cubit.dart';
import 'package:bmi_cal/bmi_cubit/states.dart';
import 'package:bmi_cal/layout/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return BmiCubit();
      },
      child: BlocConsumer<BmiCubit, BmiStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: const BmiScreen(),
            debugShowCheckedModeBanner: false,
            themeMode:
                BmiCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    bodyText2: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white),
            darkTheme: ThemeData(
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                    bodyText2: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: Colors.black),
          );
        },
      ),
    );
  }
}
