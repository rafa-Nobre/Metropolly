import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import '../common/widgets/common_text.dart';

class PostCreationPage extends StatefulWidget {
  const PostCreationPage({super.key});

  @override
  State<PostCreationPage> createState() => _PostCreationPageState();
}

class _PostCreationPageState extends State<PostCreationPage> {
  bool _isTitleDone = false;
  bool _isCheckboxSelected = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _selectCheckBox(bool? value) {
    setState(() {
      _isCheckboxSelected = value!;
    });
  }

  @override
  void initState() {
    _titleController.addListener(() {
      setState(() {
        _isTitleDone = _titleController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Post"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Título",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: defaultSpacing),
              TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Descrição (Opcional)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                  ),
                  alignLabelWithHint: true,
                  hintMaxLines: 20,
                  helperText: "Teste",
                ),
                maxLines: 8,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: defaultSpacing),
              Row(
                children: [
                  Checkbox(
                    value: _isCheckboxSelected,
                    onChanged: (bool? value) => _selectCheckBox(value),
                    checkColor: Colors.white,
                  ),
                  const CommonText(text: "Thread normal"),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isTitleDone ? () => Navigator.of(context).pop() : null,
        elevation: 0.0,
        backgroundColor: _isTitleDone ? secondaryColor : Colors.grey,
        child: const Icon(Icons.done),
      ),
    );
  }
}
