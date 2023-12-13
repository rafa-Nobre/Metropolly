import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/info_dialog.dart';
import 'package:metropolly/app/core/services/auth_service.dart';
import '../common/constants/loading_state.dart';
import '../common/widgets/common_text.dart';
import '../common/widgets/confirmation_dialog.dart';
import '../routes/routes_consts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();

  final GlobalKey<FormState> _formController = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;

  LoadingState? requisition;

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

  void _onSignUp() async {
    if (_formController.currentState != null) {
      requisition = LoadingState.loading;
      if (_formController.currentState!.validate()) {
        //String username = _usernameController.text;
        String email = _emailController.text;
        String password = _passwordController.text;

        await _auth.signUpUserMethod(email, password).then((value) {
          if (value != null) {
            requisition = LoadingState.completed;
            infoDialog(context, "Cadastro realizado", "Seja bem vindo ao futuro!");
            Navigator.of(context).pushNamed(RoutesConsts.root);
          } else {
            infoDialog(context, "Ops!", "Ocorreu um erro ao realizar o cadastro");
          }
        });
      } else {
        requisition = LoadingState.error;
      }
    }
  }

  @override
  void dispose() {
    if (_formController.currentState != null) _formController.currentState!.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();

    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var containerHeight = height - 120;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => confirmationDialog(
              context,
              "Sair",
              "Suas alterações serão perdidas.",
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesConsts.login,
                ModalRoute.withName(RoutesConsts.signUp),
              ),
            ),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    height: containerHeight / 1.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Nome e sobrenome",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo obrigatório";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Nome de usuário",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo obrigatório";
                            } else {
                              return null;
                            }
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo obrigatório";
                            } else {
                              return null;
                            }
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo obrigatório";
                            } else {
                              return null;
                            }
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Campo obrigatório";
                            } else if (value != _passwordController.text) {
                              return "Senhas não são iguais!";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultSpacing),
                  ElevatedButton(
                    onPressed: _onSignUp,
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                    child: requisition == LoadingState.loading && requisition != null
                        ? const CircularProgressIndicator()
                        : const CommonText(text: 'Cadastrar', textColor: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
