import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/signin_button.dart';
import 'package:chatapp/components/textbox.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final void Function()? onTap;

  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }

    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat,
              size: 70,
            ),
            SizedBox(
              height: 30,
            ),
            Text('Welcome back from the chat app'),
            SizedBox(
              height: 50,
            ),
            TextBox(
                controller: emailController,
                obscureText: false,
                hintText: "Enter email"),
            TextBox(
                controller: passwordController,
                obscureText: true,
                hintText: 'Enter password'),
            SizedBox(
              height: 20,
            ),
            SignInButton(
              onTap: () => login(context),
              text: 'Login',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member? '),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register Now',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
