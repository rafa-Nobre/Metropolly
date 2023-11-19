import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/common_text.dart';
import 'package:metropolly/app/routes/routes_consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formController = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isCheckboxSelected = true;

  void turnPasswordVisible() {
    setState(() {
      if (_isPasswordVisible == false) {
        _isPasswordVisible = true;
      } else {
        _isPasswordVisible = false;
      }
    });
  }

  void selectCheckBox(bool? value) {
    setState(() {
      _isCheckboxSelected = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor,
          height: pageSize.height,
          width: pageSize.width,
          child: Padding(
            padding: const EdgeInsets.all(defaultSpacing),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Metropolly',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 100.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Form(
                          key: _formController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  label: Text('Email', style: TextStyle(color: Colors.white)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                              const SizedBox(height: defaultSpacing),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  label: const Text('Senha', style: TextStyle(color: Colors.white)),
                                  border:
                                      const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
                                  suffixIcon: IconButton(
                                    icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                                    onPressed: () => turnPasswordVisible(),
                                  ),
                                ),
                                textInputAction: TextInputAction.done,
                                obscureText: _isPasswordVisible,
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _isCheckboxSelected,
                                    onChanged: (bool? value) => selectCheckBox(value),
                                    checkColor: Colors.white,
                                  ),
                                  const CommonText(text: 'Lembrar de mim', textColor: Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      SizedBox(
                        width: pageSize.width / 2,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).popAndPushNamed(RoutesConsts.root),
                          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                          child: const CommonText(text: 'Entrar', textColor: Colors.black),
                        ),
                      ),
                      const TextButton(
                        onPressed: null,
                        child: CommonText(text: 'Esqueci minha senha!', textColor: Colors.white),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.signUp),
                  child: const CommonText(text: 'Não possui acesso? Cadastre-se aqui!', textColor: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
