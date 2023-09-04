import 'package:bloc_test/buisness_logic/cubits/counter%20funtions/counter_cubit.dart';
import 'package:bloc_test/buisness_logic/cubits/user_data/user_cubit.dart';
import 'package:bloc_test/data/service/api_service.dart';
import 'package:bloc_test/presentation/screens/counter_screen.dart';
import 'package:bloc_test/presentation/screens/userdata_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(
              create: (context) => UserCubit(apiService: ApiService())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const UserDataScreen(),
        ));
  }
}
