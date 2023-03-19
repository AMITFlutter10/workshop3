import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop3/bloc/counter_cubit.dart';
import 'package:workshop3/bloc/counter_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit cubit = CounterCubit.get(context);
    return Scaffold(
      body: Column(
        children: [
          Switch(
              value: !cubit.isDarkTheme,
              onChanged: (value) {
                cubit.changeAppTheme();
              }
          )
        ],
      ),
    );
  }
}
