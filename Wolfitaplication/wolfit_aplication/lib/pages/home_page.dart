import 'package:flutter/material.dart';
import 'package:wolfit_aplication/utils/main_menu.dart';
import 'package:wolfit_aplication/widgets/ejercicios_widget.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     int _selectedIndex = 1;

  void initState() {
    super.initState();
  }

  final List<String> _options = ["Plan", " Ejercicios ", "Información ", "Nutrición"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(_options[_selectedIndex])),
      body: contentWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          _selectedIndex = index;
          setState(() {
            
          });
        },
        type: BottomNavigationBarType.fixed,
        items: menuOption
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
            .toList(),
        currentIndex: _selectedIndex,
      ),
    );
  }
}