import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:workshop3/bloc/counter_cubit.dart';
import 'package:workshop3/bloc/counter_state.dart';
import 'package:workshop3/pages/home_screen.dart';
import 'package:workshop3/provider/counter_provider.dart';
import 'package:workshop3/utilities/theme.dart';

import 'local/sheard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  runApp(
       MultiBlocProvider(
      providers: [
      BlocProvider(create: (_) => CounterCubit())
  ],
           child: MyApp())) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CounterCubit cubit = CounterCubit.get(context);
    // cubit.getTheme();


      //provider
      // MultiProvider(
      // providers: [Provider(create: (_) => CounterProvider())],
      return BlocBuilder<CounterCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: cubit.isDarkTheme ? AppThemes.darkTheme :
            AppThemes.lightTheme,
            home: HomeScreen(),
          );
        },
      );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     CounterCubit cubit = CounterCubit.get(context);
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(title, style: TextStyle(
//               color: Colors.grey
//           ),),
//         ),
//         body: Center(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 //provider
//                 // Consumer<CounterProvider>(
//                 //   builder: (context, provider, child) {
//                 //     return Text(
//                 //       '${provider.counter}',
//                 //       style: Theme.of(context).textTheme.headlineMedium,
//                 //     );},
//                 // BlocBuilder<CounterCubit, AppState>(
//                 //   builder: (context, state) {
//                 //     return Text("${cubit.counter}");
//                 //     //Text("${CounterCubit.get(context).counter}");
//                 //   },
//                 // ),
//                 BlocConsumer<CounterCubit, AppState>(
//                   listener: (context, state) {
//                     if (state is ChangeCounterState) {
//                       // alert
//                     }
//                   },
//                   builder: (context, state) {
//                     return Text("${cubit.counter}");
//                   },
//                 ),
//
//               ]),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: CounterCubit
//               .get(context)
//               .incrementCounter,
//           // provider
//           //Provider.of<CounterProvider>(context).incrementCounter,
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ));
//   }
// } // This trailing comma makes auto-formatting nicer for build meth
