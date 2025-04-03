import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/models/color_model.dart';
import 'package:test_application/ui/home_page/bloc/home_page_cubit.dart';
import 'package:test_application/ui/home_page/bloc/home_page_state.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HomePageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<HomePageCubit, HomePageState>(
      listenWhen: (previous, current) => previous.color != current.color,
      listener: (context, state) {},
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          ColorModel color =
              state.color ?? ColorModel(red: 0, green: 0, blue: 0, opacity: 0);

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
      ),
    );
  }
}
