import 'package:flutter/material.dart';
import 'package:frontend/home_screen/home_screen.dart';
import 'package:mirai/mirai.dart';

void main() async {
  await Mirai.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          dynamicSchemeVariant: DynamicSchemeVariant.content,
        ),
      ),
      home: const MyHomePage(title: 'Server Driven UI Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeScreen(username: 'simon'),
          HomeScreen(username: 'ruben'),
          HomeScreen(username: 'guest'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) => setState(() => _tabController.index = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Simon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Ruben',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Guest',
          ),
        ],
      ),
    );
  }
}
