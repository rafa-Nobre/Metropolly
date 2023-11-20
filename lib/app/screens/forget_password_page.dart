import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import '../common/colors/app_colors.dart';
import '../common/widgets/common_text.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Insira seu email para receber a mensagem para recuperar sua senha!"),
              TextField(
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
              ElevatedButton(
                onPressed: null,
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
                child: const CommonText(text: 'Recuperar', textColor: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
