import 'package:bloc_test/buisness_logic/cubits/counter%20funtions/counter_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit()
      : super(CounterCubitState(
          counterValue: 0,
        ));

  void counterIncrement() => emit(CounterCubitState(
      counterValue: state.counterValue + 1, isSnackBarMsg: true));

  void counterDecrement() => emit(CounterCubitState(
      counterValue: state.counterValue - 1, isSnackBarMsg: false));
}
