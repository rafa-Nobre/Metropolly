import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/core/models/post_model.dart';
import '../common/widgets/common_text.dart';
import '../core/services/post_service.dart';

class PostCreationPage extends StatefulWidget {
  const PostCreationPage({super.key});

  @override
  State<PostCreationPage> createState() => _PostCreationPageState();
}

class _PostCreationPageState extends State<PostCreationPage> {
  bool _isTitleDone = false;
  bool _isOportunityPost = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _selectCheckBox(bool? value) {
    setState(() {
      _isOportunityPost = value!;
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

  void onCreatePost() async {
    String title = _titleController.text;
    String? description = _descriptionController.text.isEmpty ? null : _descriptionController.text;
    bool oportunity = _isOportunityPost;

    final post = PostModel(title: title, description: description, isOportunity: oportunity);
    final postService = PostService();

    await postService.createPost(post, context).then((_) {
      Navigator.of(context).pop();
    });
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
                ),
                maxLines: 8,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: defaultSpacing),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _isOportunityPost,
                    onChanged: (bool? value) => _selectCheckBox(value),
                    checkColor: Colors.white,
                  ),
                  const CommonText(text: "Oportunidade"),
                  // Tooltip(
                  //   message: "Teste",
                  //   child: IconButton(
                  //     icon: const Icon(
                  //       Icons.question_mark,
                  //       size: 16,
                  //     ),
                  //     onPressed: () => print("question"),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isTitleDone ? onCreatePost : null,
        elevation: 0.0,
        backgroundColor: _isTitleDone ? secondaryColor : Colors.grey,
        child: const Icon(Icons.done),
      ),
    );
  }
}
