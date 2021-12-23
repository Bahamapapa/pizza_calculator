import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  bool? _isSlimDough = false;
  double _pizzaSize = 20.0;

  // This widget is the root of your application.
  @override
  State  createState() => _MyApp();


  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2));
    const linkTextStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0079D0)
    );

    return MaterialApp(
      home: Scaffold(
       /*   appBar: AppBar(
            title: const Text('Home'),
          ),*/
          body: Container(
            width: double.infinity,
            child: Column(children: [
              SizedBox(height: 48,),
              SizedBox(height: 220, child: Image.asset('assets/images/pizza-cut.png'), ),
              SizedBox(height: 20,),
              Text("Калькулятор пиццы",
                  style: TextStyle(fontSize: 36, color: Color(0xFF000000))),
              Text("Выберите параметры:",
                  style: TextStyle(fontSize: 16, color: Color(0xFF000000))),
              SizedBox(height: 20,),
              SizedBox(width: 300,
                child: SlidingSwitch(
                  value: false,
                  width: 300,
                  onChanged: (bool value) {
                    _isSlimDough = value;
                  //  setState(() {
                  //    _calcCost();
                  },
                  height: 30,
                  animationDuration: const Duration(milliseconds: 100),
                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                  textOff: "Обычное тесто",
                  textOn: "Тонкое тесто",
                  colorOn: const Color(0xffFFFFFF),
                  colorOff: const Color(0xf0FFFFFF),
                  background: const Color(0xffECEFF1),
                  buttonColor: const Color(0xff0079D0),
                  inactiveColor: const Color(0xff636f7b),
                ),
              ),

              // Pizza size selector slider
            SizedBox(width: 300,
              child:SfSlider(
              min: 20.0,
              max: 60.0,
              value: _pizzaSize,
              interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                setState(() {
                  _pizzaSize = value;
                });
              },
            )),


            /*SizedBox(width: 224,

                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: "Телефон",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(width: 224,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: "Пароль",
                  ),
                ),
              ),*/
              SizedBox(height: 28,),
              SizedBox(width: 154, height: 42,
                  child: ElevatedButton(onPressed: () {},
                    child: Text('Войти'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 32,),
              InkWell(child: const Text('Регистрация',
                style: linkTextStyle,
              ),
                  onTap: () {}),
              SizedBox(height: 20,),
              InkWell(child: const Text('Забыли пароль?',
                style: linkTextStyle,
              ), onTap: () {}),

            ],),
          )
      ),
    );
  }
}

class _MyApp extends State  {
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFFFE306));
  }
}


