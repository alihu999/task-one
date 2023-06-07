import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/homepage.dart';
import 'package:project/user_repository.dart';

import 'bloc/app_events.dart';
import 'bloc/app_states.dart';
import 'bloc/bloc.dart';

import 'package:project/widget/custom_button.dart';
import 'package:project/widget/custom_textformfield.dart';
import 'package:project/widget/custom_text_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(UserRepository()))
      ],
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: BlocProvider(
          create: (context) => UserBloc(
            UserRepository(),
          )..add(LoadUserEvent()),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              double high = MediaQuery.of(context).size.height;
              String username = "";
              String password = "";
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UeserErrorState) {
                return const Center(
                  child: Text("Error"),
                );
              }
              if (state is UserLoadedState) {
                return Center(
                  child: SafeArea(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Column(
                          children: [
                            const Icon(Icons.login,
                                size: 100, color: Colors.white),
                            const Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            Form(
                              key: formkey,
                              child: Container(
                                height: high * 0.72,
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(
                                    right: 15, left: 15, top: 15),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Login with your username and password",
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    CustomTextFormField(
                                      lable: 'Username',
                                      icondata: const Icon(Icons.person),
                                      onSaved: (val) {
                                        username = val!;
                                      },
                                    ),
                                    CustomTextFormField(
                                      lable: 'password',
                                      icondata: const Icon(Icons.key),
                                      ispassword: true,
                                      onSaved: (val) {
                                        password = val!;
                                      },
                                    ),
                                    const CustomTextButton(
                                      lable: 'Forget Password?',
                                      textrow: "",
                                    ),
                                    CustomButton(
                                      label: 'Login',
                                      onTap: () {
                                        final isValidForm =
                                            formkey.currentState!.validate();
                                        if (isValidForm) {
                                          if (state.useres[0]['username'] !=
                                              username) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "UserName not correct")));
                                          } else if (state.useres[0]
                                                  ['password'] !=
                                              password) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "password not correct")));
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()));
                                          }
                                        }
                                      },
                                    ),
                                    const CustomTextButton(
                                      lable: 'Signup',
                                      textrow: "Don't have an account? ",
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
