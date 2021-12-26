import 'package:flutter/material.dart';
import 'package:pizza_calculator/navigation_drawer_screen.dart';
import 'package:pizza_calculator/pizza_calculator_screen.dart';
import 'package:pizza_calculator/auth_page.dart';

void main() {
  runApp(const MaterialApp(
    title: "Pizza",
      home: AuthPage(),
  )/*const PizzaCalculatorScreen() const NavigationDrawerScreen()*/);
}
