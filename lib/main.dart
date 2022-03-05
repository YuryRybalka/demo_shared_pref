import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const SharedPrefScreen());
}

class SharedPrefScreen extends StatelessWidget {
  const SharedPrefScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared pref демонстрация',
      home: MyHomePage(title: 'Shared pref demo,'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage ({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Кнопка нажата $_counter ', style: Theme
                .of(context)
                .textTheme
                .headline4),
            Text(' раз', style: Theme
                .of(context)
                .textTheme
                .headline4)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Увеличение',
        child: const Icon(Icons.add),
      ),
    );
  }

  //Загрузка стартового значения счетчика
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //По клику увеличить счетчик

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }
}

