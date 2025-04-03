import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/ui/home_page/cubit/home_page_cubit.dart';
import 'package:test_application/ui/home_page/cubit/home_page_state.dart';

/// A screen that displays the current color.
class HomePageScreen extends StatefulWidget {
  /// Constructor for [HomePageScreen].
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        final ColorModel color =
            state.color ??
            const ColorModel(red: 0, green: 0, blue: 0, opacity: 0);

        return GestureDetector(
          onTap: () {
            context.read<HomePageCubit>().changeCurrentColor();
          },
          child: Scaffold(
            backgroundColor: Color.fromRGBO(
              color.red,
              color.green,
              color.blue,
              color.opacity,
            ),
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Text('Hello', style: textTheme.headlineMedium),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HomePageCubit>().init();
  }
}
