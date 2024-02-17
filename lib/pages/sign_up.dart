import 'package:flutter/material.dart';
import 'package:haptext_api/exports.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/register-screen';

  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: context.theme.bgColor,
      body: Container(
        height: size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/hapz_logo.png"),
                  width: 125,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Create an Account',
                  style: TextStyle(
                    // color: context.theme.titleTextColor,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      InputField(
                        labelText: 'Username',
                        icon: Icon(Icons.person),
                        controller: _usernameController,
                      ),
                      InputField(
                        labelText: 'First Name',
                        icon: Icon(Icons.switch_account),
                        controller: _firstNameController,
                      ),
                      InputField(
                        labelText: 'Last Name',
                        icon: Icon(Icons.switch_account),
                        controller: _lastNameController,
                      ),
                      InputField(
                        labelText: 'Email address',
                        icon: Icon(Icons.mail),
                        controller: _emailController,
                      ),
                      InputField(
                        labelText: 'Password',
                        icon: Icon(Icons.lock),
                        controller: _passwordController,
                        isObscure: true,
                      ),
                      const SizedBox(height: 35.0),
                      SizedBox(
                        width: size.width * 0.75,
                        child: CustomButton(
                          onPressed: () async {
                            try {
                              final apiUrl = 'https://test-backend-dlfq.onrender.com/social_backend/user/register';
                              final response = await http.post(
                                Uri.parse(apiUrl),
                                body: {
                                  'userName': _usernameController.text,
                                  'firstName': _firstNameController.text,
                                  'lastName': _lastNameController.text,
                                  'email': _emailController.text,
                                  'password': _passwordController.text,
                                },
                              );

                              if (response.statusCode == 200) {
                                print('Registration successful');
                                Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
                              } else {
                                print('Registration failed');
                                print(response.body);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Registration failed. Please try again.'),
                                  ),
                                );
                              }
                            } catch (error) {
                              print('Error during registration: $error');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('An error occurred during registration. Please try again later.'),
                                ),
                              );
                            }
                          },
                          text: 'Create Account',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an Account?',
                      style: TextStyle(
                        fontSize: 12,
                        // color: context.theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 60.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SignIn()));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 12,
                          // color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
