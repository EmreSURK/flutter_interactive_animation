import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oaktree_order_tracking/MainPage.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: Colors.blue.shade900,
          // displayColor: Colors.pink,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

Widget mainButton() {
  return SizedBox(
    width: 120,
    child: StandartContainer(
      child: [
        SizedBox(),
        Icon(
          Icons.history,
          size: 45,
          color: Colors.blue.shade900,
          // shadows: <Shadow>[Shadow(color: Colors.black,  blurRadius: -15.0)],
        ),
        "All Orders".text.lg.make(),
      ]
          .column(
            alignment: MainAxisAlignment.spaceAround,
          )
          .aspectRatio(1),
    ),
  );
}

Widget StandartContainer({required Widget child}) {
  return child
      // .p20()
      .box
      .withDecoration(
        BoxDecoration(
          boxShadow: kShadow,
          image: const DecorationImage(
            image: AssetImage(
              "assets/images/boxBack.jpg",
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(33),
        ),
      )
      .shadow5xl
      .make();
}

const kShadow = [
  BoxShadow(
    blurRadius: 22,
    blurStyle: BlurStyle.outer,
    spreadRadius: -9,
    offset: Offset(0, 9),
  )
];
