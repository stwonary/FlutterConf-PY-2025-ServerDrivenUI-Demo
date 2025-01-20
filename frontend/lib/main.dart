import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/home_screen/home_screen.dart';
import 'package:frontend/inapp_message/in_app_banner.dart';
import 'package:frontend/inapp_message/in_app_message_cubit.dart';
import 'package:frontend/inapp_message/in_app_message_listener.dart';
import 'package:mirai/mirai.dart';

void main() async {
  await Mirai.initialize();
  WidgetsFlutterBinding.ensureInitialized();
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
      home: BlocProvider<InAppMessageCubit>(
        create: (context) => InAppMessageCubit(),
        child: const InAppMessagingListener(
          child: HomePage(title: 'Server Driven UI Demo'),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
      body: Column(
        children: [
          const InAppBanner(tag: 'home'),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                HomeScreen(username: 'simon'),
                HomeScreen(username: 'ruben'),
                HomeScreen(username: 'guest'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          setState(() => _tabController.index = index);
          context.read<InAppMessageCubit>().runJs(event: {
            'index': index,
          });
        },
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
