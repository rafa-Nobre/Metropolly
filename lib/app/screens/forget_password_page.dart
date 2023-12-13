import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import '../common/colors/app_colors.dart';
import '../common/constants/loading_state.dart';
import '../common/widgets/common_text.dart';
import '../common/widgets/info_snackbar.dart';
import '../core/services/auth_service.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final AuthService _auth = AuthService();

  final GlobalKey<FormState> _formController = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  LoadingState? requisition;

  void _onResetPassword() async {
    requisition = LoadingState.loading;

    if (_formController.currentState != null) {
      if (_formController.currentState!.validate()) {
        String email = _emailController.text;

        await _auth.resetPasswordMethod(email).then((_) {
          requisition = LoadingState.completed;

          showInfoSnackBar(
            context,
            "Enviamos um email para sua caixa de entrada!",
            duration: 3,
            icon: Icons.check,
            iconColor: confirmColor,
          );
        });
      }
    }

    requisition = LoadingState.completed;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar senha"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: SizedBox(
          height: height / 4,
          child: Form(
            key: _formController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Insira seu email para receber a mensagem para recuperar sua senha!"),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo obrigatório";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                ElevatedButton(
                  onPressed: _onResetPassword,
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
                  child: requisition == LoadingState.loading && requisition != null
                      ? const CircularProgressIndicator()
                      : const CommonText(text: 'Recuperar', textColor: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
