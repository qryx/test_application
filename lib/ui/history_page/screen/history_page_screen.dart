import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/ui/history_page/cubit/history_page_cubit.dart';
import 'package:test_application/ui/history_page/cubit/history_page_state.dart';
import 'package:test_application/ui/home_page/cubit/home_page_cubit.dart';

/// A screen that displays the history of colors.
class HistoryPageScreen extends StatefulWidget {
  /// Constructor for [HistoryPageScreen].
  const HistoryPageScreen({super.key});

  @override
  State<HistoryPageScreen> createState() => _HistoryPageScreenState();
}

class _HistoryPageScreenState extends State<HistoryPageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryPageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<HistoryPageCubit, HistoryPageState>(
      builder: (context, state) {
        final cubit = context.read<HistoryPageCubit>();
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return state.colors.isNotEmpty
            ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: GestureDetector(
                      onTap: cubit.deleteAllColors,
                      child: Text(
                        'Clear All History',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.colors.length,

                    itemBuilder: (context, index) {
                      final color = state.colors[index];

                      return ListTile(
                        title: GestureDetector(
                          onTap: () {
                            context.read<HomePageCubit>().changeCurrentColor(
                              changeColor: color,
                            );
                            final double brightness =
                                (0.299 * color.red) +
                                (0.587 * color.green) +
                                (0.114 * color.blue);
                            final snackBar = SnackBar(
                              content: Text(
                                'Color changed: '
                                '(${color.red}, ${color.green}, ${color.blue})',
                                style: textTheme.headlineMedium?.copyWith(
                                  color:
                                      brightness > 128
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                              showCloseIcon: true,
                              closeIconColor:
                                  brightness > 128
                                      ? Colors.black
                                      : Colors.white,
                              backgroundColor: Color.fromRGBO(
                                color.red,
                                color.green,
                                color.blue,
                                color.opacity,
                              ),
                              duration: const Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(),
                              color: Color.fromRGBO(
                                color.red,
                                color.green,
                                color.blue,
                                color.opacity,
                              ),
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () => cubit.deleteColor(color),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
            : Center(
              child: Text(
                'No colors history found',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
      },
    );
  }
}
