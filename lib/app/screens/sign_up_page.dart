import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/confirmation_dialog.dart';
import '../common/widgets/common_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formController = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _studentIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;

  void turnPasswordVisible() {
    setState(() {
      if (_isPasswordVisible == false) {
        _isPasswordVisible = true;
      } else {
        _isPasswordVisible = false;
      }
    });
  }

  void turnRepeatPasswordVisible() {
    setState(() {
      if (_isRepeatPasswordVisible == false) {
        _isRepeatPasswordVisible = true;
      } else {
        _isRepeatPasswordVisible = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var containerHeight = height - 120;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => confirmationDialog(context, "Sair", "Suas alterações serão perdidas."),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSpacing),
        child: Form(
          key: _formController,
          child: SizedBox(
            height: containerHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: containerHeight / 1.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Nome",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      TextFormField(
                        controller: _studentIDController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Matrícula",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => turnPasswordVisible(),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        obscureText: _isPasswordVisible,
                      ),
                      TextFormField(
                        controller: _repeatPasswordController,
                        decoration: InputDecoration(
                          labelText: "Repita sua senha",
                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
                          suffixIcon: IconButton(
                            icon: Icon(_isRepeatPasswordVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => turnRepeatPasswordVisible(),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        obscureText: _isRepeatPasswordVisible,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: defaultSpacing),
                SizedBox(
                  width: width / 4,
                  child: const ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                    child: CommonText(text: 'Cadastrar', textColor: Colors.black),
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
