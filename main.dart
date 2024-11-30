import 'package:flutter/material.dart';

void main() {
  runApp(SignupApp());
}

class SignupApp extends StatelessWidget {
  const SignupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Flow'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create an Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value ?? '';
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value ?? '';
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value ?? '';
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Signup Successful! Welcome, $name!'),
                      ),
                    );
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
