import 'package:flutter/material.dart';
import 'package:haptext_api/exports.dart';
//import 'package:main_hapztext/controllers/exports.dart';
//import 'package:main_hapztext/controllers/user_controller.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/login-screen';

  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // void navigateToSignUpScreen(BuildContext context) {
  //   Navigator.pushNamed(context, SignUp.routeName);
  // }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose;
    _passwordController.dispose;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: context.theme.bgColor,
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/hapz_logo.png"),
                width: 125,
              ),
              const SizedBox(height: 30.0),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  // color: context.theme.titleTextColor,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(children: [
                  InputField(
                    labelText: 'Email',
                    icon: Icon(Icons.mail),
                    controller: _emailController,
                  ),
                  InputField(
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                    controller: _passwordController,
                    isObscure: true,
                  ),
                  const SizedBox(height: 40.0),
                  SizedBox(
                    width: size.width * 0.75,
                    child: CustomButton(
                      onPressed: () {
                        // authController.loginUser(_emailController.text, _passwordController.text,);
                        print('Log in button pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Home()),
                        );
                      },
                      text: 'Log in',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      print('Forgot password button clicked');
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (_) => SignUp())
                      // );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 12,
                        // color: context.theme.primaryColor,
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 35.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Don\'t have an Account?',
                  style: TextStyle(
                    fontSize: 12,
                    // color: context.theme.buttonColor,
                  ),
                ),
                SizedBox(width: 55.0),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignUp())),
                  // navigateToSignUpScreen(context),
                  child: Text(
                    'Join Now',
                    style: TextStyle(
                      fontSize: 12,
                      // color: context.theme.primaryColor,
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    ));
  }
}
