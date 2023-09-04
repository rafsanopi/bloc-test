import 'package:bloc_test/buisness_logic/cubits/counter%20funtions/counter_cubit.dart';
import 'package:bloc_test/buisness_logic/cubits/counter%20funtions/counter_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Bloc"),
        ),
        body: BlocListener<CounterCubit, CounterCubitState>(
          listener: (context, state) {
            if (state.isSnackBarMsg == true) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Incremented"),
                duration: Duration(microseconds: 200),
              ));
            } else if (state.isSnackBarMsg == false) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Decremented"),
                duration: Duration(microseconds: 200),
              ));
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterCubit, CounterCubitState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().counterIncrement();
                        },
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().counterDecrement();
                        },
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
