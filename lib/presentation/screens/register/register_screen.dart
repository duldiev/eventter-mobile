// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_mobile/helper/text_styles.dart';
import 'package:flutter_mobile/presentation/widgets/buttons/main_button.dart';
import 'package:flutter_mobile/presentation/widgets/others/custom_check_box.dart';
import 'package:flutter_mobile/presentation/widgets/others/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Header4(title: "Регистрация"),
                      SizedBox(
                        height: 10,
                      ),
                      Subtitle1(title: "Создайте аккаунт вместе с нами."),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Label1(title: "Имя"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          hintText: "Jack",
                        ),
                      ),
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
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Label1(title: "Дата рождения"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          hintText: "__.__.______",
                          keyboardType: TextInputType.datetime,
                          sufficIcon: Icons.date_range,
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
                          hintText: "Создайте пароль",
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomTextField(
                          hintText: "Повторите пароль",
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomCheckBox(
                                value: true,
                                onChanged: (value) {},
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: PolicyTermsText(
                                blackTitle: "Я прочитал(-а) и согласен(-на) с",
                                blueTitle:
                                    "условиями пользовательского соглашения",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MainButton(
                              title: "Войти",
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AlternativeLogin(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
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

class AlternativeLogin extends StatelessWidget {
  const AlternativeLogin({
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
              "Есть аккаунт?",
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
              "Войти",
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
