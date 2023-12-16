import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../components/background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void gotoDashboard() {
      Navigator.pushNamed(context, '/dashboard');
    }

    return Background(
      topImage: "assets/images/main_top.png",
      bottomImage: "assets/images/login_bottom.png",
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                const Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultPadding * 2),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: SvgPicture.asset("assets/icons/login.svg"),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: defaultPadding * 2),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: kPrimaryColor,
                          onSaved: (email) {},
                          decoration: const InputDecoration(
                            hintText: "Your email",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            cursorColor: kPrimaryColor,
                            decoration: const InputDecoration(
                              hintText: "Your password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        ElevatedButton(
                          onPressed: gotoDashboard,
                          child: const Text(
                            "LOGIN",
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Don’t have an Account ? ",
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
