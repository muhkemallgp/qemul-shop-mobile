// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'dart:convert' as convert;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:qemulshop_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String password1 = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 118, 4, 42),
              Color.fromARGB(255, 211, 68, 80)
            ])),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Stack(
                        children: const [
                          Center(
                            child: Text('Register Account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 55,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "contoh: Dummy123",
                                labelText: "Username",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  username = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  username = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Masukkan Password",
                                labelText: "Password",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                icon: const Icon(
                                  Icons.lock_outline,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  password1 = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  password1 = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Konfirmasi Password",
                                labelText: "Konfirmasi Password",
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                icon: const Icon(Icons.lock_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  password2 = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  password2 = value!;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: size.height * 0.08,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFF24262A),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Submit to Django server and wait for response
                                  final response = await request.postJson(
                                      "https://muhkemal-lathif-tugas.pbp.cs.ui.ac.id/auth/register/",
                                      convert.jsonEncode(<String, String>{
                                        'username': username,
                                        'password1': password1,
                                        'password2': password2,
                                      }));
                                  if (response['status'] == 'success') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "Account has been successfully registered!"),
                                    ));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "An error occured, please try again."),
                                    ));
                                  }
                                }
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    height: 1.5),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Route menu ke counter
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      height: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
