import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/signin_button.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/textbox.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key, required this.onTap});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final void Function()? onTap;

  void signUp(BuildContext context) {
    final _auth = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Passwords don't match!"),
              ));
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
            Text('Welcome from the chat app'),
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
            TextBox(
                controller: confirmPasswordController,
                obscureText: true,
                hintText: 'Confirm password'),
            SizedBox(
              height: 20,
            ),
            SignInButton(
              onTap: () => signUp(context),
              text: 'Sign Up',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already a member? '),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login Now',
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
