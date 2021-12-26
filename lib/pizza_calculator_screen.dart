import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class PizzaCalculatorScreen extends StatefulWidget {
  const PizzaCalculatorScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalculatorScreenState createState() => _PizzaCalculatorScreenState();
}

enum Sauce { hot, sweet, cheese }

class _PizzaCalculatorScreenState extends State<PizzaCalculatorScreen> {
  bool _isSlimDough = false;
  double _pizzaSize = 40;
  int _cost = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;

  int _calcCost() {
    _cost = _pizzaSize.round() + 100;

    if (_isSlimDough == true) _cost += 30;
    if (_addCheese == true) _cost += 50;

    switch (_sauce) {
      case Sauce.hot:
        _cost += 10;
        break;
      case Sauce.sweet:
        _cost += 20;
        break;
      case Sauce.cheese:
        _cost += 40;
        break;
      case null:
        _sauce = Sauce.hot;
        break;
    }
    return _cost;
  }

  void _onSauceChanged(Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
 /*   const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Color(0xFFbbbbbb), width: 2));
    const linkTextStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0079D0));
*/
    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
             appBar: AppBar(
               title: const Text('Заказ пиццы'),
               actions: [
                 IconButton(onPressed: () {}, icon: const Icon (Icons.announcement_rounded)),
                 TextButton(
                     onPressed: () {},
                     child: const Text("Профиль"),
                 style: buttonStyle,
                 ),

                 //IconButton(onPressed: () {}, icon: const Icon (Icons.eleven_mp_sharp)),
                 //IconButton(onPressed: () {}, icon: const Icon (Icons.one_k_plus_sharp)),

               ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 132,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Image.asset('assets/images/pizza-and-ingredients.jpeg'),
                        ),
                        //const Text("Навигация во Flutter")
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.one_k),
                  title: const Text("Каталог"),
                  onTap: () {
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text('Переход в каталог')));

                  },
                ),
                ListTile(
                    leading: const Icon(Icons.two_k),
                    title: const Text("Корзина"),
                    onTap: (){
                      _messengerKey.currentState!.showSnackBar(
                          const SnackBar(content: Text('Переход в корзину')));
                    }
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Профиль"),
                ),
                ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Настройки"),
                    onTap: (){
                      _messengerKey.currentState!.showSnackBar(
                          const SnackBar(content: Text('Переход в настройки')));
                    }
                ),
              ],

            ),
          ),
          body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/pizza-cut.png'),
            ),

            /*
            const Text("Калькулятор пиццы",
                style: TextStyle(fontSize: 36, color: Color(0xFF000000))),

             */
            const Text("Выберите параметры:",
                style: TextStyle(fontSize: 16, color: Color(0xFF000000))),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 300,
              child: SlidingSwitch(
                value: false,
                width: 300,
                onChanged: (bool value) {
                  _isSlimDough = value;
                  setState(() {
                    _calcCost();
                  });
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
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: const Text("Размер",
                  style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
            ),
            SizedBox(
                width: 300,
                child: SfSlider(
                  min: 20,
                  max: 60,
                  value: _pizzaSize,
                  interval: 20,
                  showTicks: true,
                  showLabels: true,
                  numberFormat: NumberFormat("## см"),
                  enableTooltip: false,
                  minorTicksPerInterval: 0,
                  stepSize: 20,
                  onChanged: (dynamic value) {
                    setState(() {
                      _pizzaSize = value;
                      _calcCost();
                    });
                  },
                )),

            const SizedBox(
              height: 10,
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: const Text("Соус",
                  style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
            ),

            RadioListTile<Sauce>(
              title: const Text("Острый"),
              value: Sauce.hot,
              groupValue: _sauce,
              onChanged: _onSauceChanged,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),

            ),
            RadioListTile<Sauce>(
              title: const Text("Кисло-сладкий"),
              value: Sauce.sweet,
              groupValue: _sauce,
              onChanged: _onSauceChanged,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
            ),
            RadioListTile<Sauce>(
              title: const Text("Сырный"),
              value: Sauce.cheese,
              groupValue: _sauce,
              onChanged: _onSauceChanged,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
            ),

            // Дополнительный сыр
            SizedBox(
              width: 300,
              child: Card(
                elevation: 0,
                color: Color(0xFFF0F0F0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: SizedBox(
                        width: 38,
                        height: 56,
                        child: Image.asset('assets/images/cheese_icon.png'),
                      ),
                    ),
                    const Text('Дополнительный сыр',
                        style: TextStyle(fontSize: 16, color: Color(0xFF263238))),
                    Switch(
                      value: _addCheese,
                      onChanged: (bool value) {
                        setState(() {
                          _addCheese = value;
                          _calcCost();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Выводим итоговую стоимоть
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text("Стоимость: ",
                  style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
            ),

          //Цена в отдельной строке
          SizedBox(
            width: 300,
            height: 50,

            child: Card(
              elevation: 0,
              color: const Color(0xFFF0F0F0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text("${_calcCost()} руб. ",
                  style: const TextStyle(fontSize: 32, color: Color(0xFF000000)),
                  textAlign: TextAlign.center,
              ),

            ),
          ),

            const SizedBox(
              height: 40,
            ),

            SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Заказать'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                )),

          ],
        ),
      )),
    );
  }
}
