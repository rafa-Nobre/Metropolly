import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/loading_state.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/common_text.dart';
import 'package:metropolly/app/routes/routes_consts.dart';
import '../common/widgets/info_snackbar.dart';
import '../core/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();

  final GlobalKey<FormState> _formController = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordObscure = true;
  bool _isCheckboxSelected = true;

  LoadingState? requisition;

  void turnPasswordVisible() {
    setState(() {
      if (_isPasswordObscure == false) {
        _isPasswordObscure = true;
      } else {
        _isPasswordObscure = false;
      }
    });
  }

  void selectCheckBox(bool? value) {
    setState(() {
      _isCheckboxSelected = value!;
    });
  }

  void _onSignIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    requisition = LoadingState.loading;

    await _auth.signInUserMethod(email, password).then((value) {
      if (value != null) {
        requisition = LoadingState.completed;
        infoSnackBar(context, "Olá. Bem vindo de volta!");
        //Navigator.of(context).popAndPushNamed(RoutesConsts.root);
        Navigator.of(context).pushNamed(RoutesConsts.root);
      } else {
        requisition = LoadingState.error;
        infoSnackBar(
          context,
          "Ops! Não foi possível validar suas credenciais.",
          duration: 3,
          icon: Icons.error,
          iconColor: alertColor,
        );
      }
    });
  }

  // @override
  // void dispose() {
  //   if (_formController.currentState != null) _formController.currentState!.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();

  //   super.dispose;
  // }

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: pageSize.height,
          width: pageSize.width,
          //color: primaryColor,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryColor, Colors.blue.shade900],
            ),
          ),
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
                                    icon: Icon(_isPasswordObscure ? Icons.visibility : Icons.visibility_off),
                                    onPressed: () => turnPasswordVisible(),
                                  ),
                                ),
                                textInputAction: TextInputAction.done,
                                obscureText: _isPasswordObscure,
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
                        width: pageSize.width / 4,
                        child: ElevatedButton(
                          onPressed: _onSignIn,
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
                          child: requisition == LoadingState.loading && requisition != null
                              ? const CircularProgressIndicator()
                              : const CommonText(text: 'Entrar', textColor: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.forgetPassword),
                        child: const CommonText(text: 'Esqueci minha senha!', textColor: Colors.white),
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
