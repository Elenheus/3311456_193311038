import 'package:untitled/core/firebase/database/database.dart';
import 'package:untitled/core/firebase/user/auth.dart';
import 'package:untitled/core/main_app.dart';
import 'package:untitled/models/data/art_topic_data.dart';
import 'package:untitled/models/data/home_topic_data.dart';
import 'package:untitled/widgets/custom_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/user/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  dynamic user;
  dynamic userData;
  dynamic artsData;
  dynamic topicsData;

  void _toggleObscurePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleObscureConfirmPassword() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: AutofillGroup(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Hesap Olustur',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Baslamak İcin Lutfen Formu Doldurunuz',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      autofillHints: const [AutofillHints.name],
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Isim',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autofillHints: const [AutofillHints.email],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lutfen Email Adresinizi Giriniz';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Lutfen Gecerli Bir Email Adresi Giriniz';
                        }
                        return null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email adresi',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lutfen Sifre Giriniz';
                        }
                        if (value.length < 6) {
                          return 'Sifte en az 6 karakterden olusmalidir';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Sifre',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? LineIcons.eyeSlash
                                : LineIcons.eye,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: _toggleObscurePassword,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autofillHints: const [AutofillHints.password],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lutfen Sifrenizi Onaylayiniz';
                        }
                        if (value != _passwordController.text) {
                          return 'Sifre Bulunamadi';
                        }
                        return null;
                      },
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Sifrenizi Onaylayiniz',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? LineIcons.eyeSlash
                                : LineIcons.eye,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: _toggleObscureConfirmPassword,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomElevatedButton(
                      isLoading: _isLoading,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          TextInput.finishAutofillContext();
                          setState(() {
                            _isLoading = true;
                          });
                          user = await Auth().registerUser(
                              email: _emailController.text,
                              password: _confirmPasswordController.text,
                              name: _nameController.text.trim(),
                              context: context);
                          userData = await Database().writeData(
                              databaseReference: FirebaseDatabase.instance,
                              path: 'users',
                              data: {
                                FirebaseAuth.instance.currentUser!.uid: {
                                  'user_name': FirebaseAuth
                                      .instance.currentUser!.displayName,
                                  'uid': FirebaseAuth.instance.currentUser!.uid,
                                  'email':
                                      FirebaseAuth.instance.currentUser!.email,
                                },
                              },
                              overwriteData: false,
                              pushData: false,
                              context: context);
                          if (user != null) {
                            for (int i = 0; i < 10; i++) {
                              await Database().writeData(
                                databaseReference: FirebaseDatabase.instance,
                                path:
                                    'topics/${homeTopics[i].databaseTitle}/${FirebaseAuth.instance.currentUser!.uid}/',
                                data: {
                                  'role': 'system',
                                  'content': homeTopics[i].content,
                                },
                                overwriteData: false,
                                pushData: true,
                                context: context,
                              );
                              await Database().writeData(
                                databaseReference: FirebaseDatabase.instance,
                                path:
                                    'arts/${artTopics[i].artist}/${FirebaseAuth.instance.currentUser!.uid}/',
                                data: {
                                  'null': 'null',
                                },
                                overwriteData: false,
                                pushData: true,
                                context: context,
                              );
                            }
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainApp(),
                              ),
                            );
                          } else {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }
                      },
                      text: 'Hesap Olustur',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Zaten Hesabiniz Var mi?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Giris Yap',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
