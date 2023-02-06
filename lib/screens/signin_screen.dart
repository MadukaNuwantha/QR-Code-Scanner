import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool showPassword;

  @override
  void initState() {
    showPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildImage(),
                buildHeadingText(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildEmailFormField(),
                      buildPasswordFormField(),
                      buildSubmitButton(),
                    ],
                  ),
                ),
                buildRedirectText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 0),
                blurRadius: 5,
              ),
            ],
          ),
          child: Image.asset(
            'assets/qr_logo.png',
            width: MediaQuery.of(context).size.width * 0.6,
          ),
        ),
      );

  Widget buildHeadingText() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              'SIGN IN',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      );

  Widget buildEmailFormField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email address';
            }
            return null;
          },
          controller: emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Email",
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      );

  Widget buildPasswordFormField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: TextFormField(
          obscureText: !showPassword,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter valid password';
            }
            return null;
          },
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
                size: 16,
              ),
            ),
            labelText: "Password",
            hintText: "Password",
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
        ),
      );

  Widget buildSubmitButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  signInUser();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildRedirectText() => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/SignUpScreen');
        },
        child: Text(
          'Create new account',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Colors.deepPurple,
          ),
        ),
      );

  void signInUser() {
    if (_formKey.currentState!.validate()) {}
  }
}
