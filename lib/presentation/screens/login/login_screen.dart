// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:flutter_mobile/helper/text_styles.dart';
import 'package:flutter_mobile/presentation/routing/app_router.dart';
import 'package:flutter_mobile/presentation/widgets/buttons/main_button.dart';
import 'package:flutter_mobile/presentation/widgets/others/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Header3(title: "Вход"),
                      SizedBox(
                        height: 10,
                      ),
                      Subtitle2(title: "Введите данные для входа."),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Label1(title: "Email"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          hintText: "name@email.com",
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Label1(title: "Пароль"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          hintText: "Enter the password",
                          obsecureText: true,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Забыли пароль?",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            MainButton(
                              title: "Войти",
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.tabBarPage,
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AlternativeRegister(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "EVENTTER",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlternativeRegister extends StatelessWidget {
  const AlternativeRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 20,
            child: Text(
              "Нет аккаунта?",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          Flexible(
            flex: 20,
            child: Text(
              "Создать",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
