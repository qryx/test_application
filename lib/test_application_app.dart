import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_application/theme/theme.dart';
import 'package:test_application/ui/history_page/bloc/history_page_cubit.dart';
import 'package:test_application/ui/history_page/screen/history_page_screen.dart';
import 'package:test_application/ui/home_page/bloc/home_page_cubit.dart';
import 'package:test_application/ui/home_page/screen/home_page_screen.dart';

class TestApplicationApp extends StatefulWidget {
  const TestApplicationApp({super.key});

  @override
  State<TestApplicationApp> createState() => _TestApplicationAppState();
}

class _TestApplicationAppState extends State<TestApplicationApp> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomePageScreen(),
      const HistoryPageScreen(),
    ];

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageCubit>(
          create: (context) => GetIt.instance<HomePageCubit>()..init(),
        ),
        BlocProvider<HistoryPageCubit>(
          create: (context) => GetIt.instance<HistoryPageCubit>()..init(),
        ),
      ],
      child: MaterialApp(
        title: 'Test Application',
        theme: theme,
        home: Scaffold(
          body: screens[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: theme.colorScheme.primary,
            selectedItemColor: theme.colorScheme.onPrimary,
            unselectedItemColor: theme.colorScheme.onSecondary,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
