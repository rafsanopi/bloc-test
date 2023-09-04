import 'package:bloc_test/buisness_logic/cubits/user_data/user_cubit.dart';
import 'package:bloc_test/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  @override
  void initState() {
    context.read<UserCubit>().getAllUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserDataError) {
              return Center(
                child: Text(state.errorMsg.toString()),
              );
            } else if (state is UserDataLoaded) {
              return ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (context, index) {
                  UserModel userModel = state.userList[index];

                  return ListTile(
                    leading: Text(userModel.id.toString()),
                    title: Text(userModel.name.toString()),
                    subtitle: Text(userModel.email.toString()),
                  );
                },
              );
            }

            return Text("Something went wrong");
          },
        ),
      ),
    );
  }
}
