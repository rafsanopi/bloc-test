part of 'user_cubit.dart';

abstract class UserState extends Equatable {}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserDataLoaded extends UserState {
  List<UserModel> userList;

  UserDataLoaded({required this.userList});
  @override
  List<Object?> get props => [userList];
}

class UserDataError extends UserState {
  String errorMsg;

  UserDataError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
