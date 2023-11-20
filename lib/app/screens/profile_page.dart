import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _studentIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        title: const Text("Perfil"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSpacing),
        child: SizedBox(
          height: containerHeight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: containerHeight / 1.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Icon(Icons.person, size: 100.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width / 2.5,
                            child: TextField(
                              controller: _nameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: "Nome",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: null,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(
                            width: width / 2.5,
                            child: TextField(
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: "Nome de usuário",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: null,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width / 2.5,
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: null,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(
                            width: width / 2.5,
                            child: TextField(
                              controller: _studentIDController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: "Matrícula",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: null,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: "Senha",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: null,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        obscureText: _isPasswordVisible,
                      ),
                    ],
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
