import 'package:bloc/bloc.dart';
import 'package:bloc_test/data/model/user_model.dart';
import 'package:bloc_test/data/service/api_service.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  List<UserModel> userList = [];
  ApiService apiService;
  UserCubit({required this.apiService}) : super(UserLoading());

  void getAllUserList() async {
    emit(UserLoading());

    try {
      userList = await apiService.getData();
      emit(UserDataLoaded(userList: userList));
      print(userList);
    } on Exception catch (e) {
      emit(UserDataError(errorMsg: e.toString()));
    }
  }
}
