import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/info_snackbar.dart';

class PostInfoPage extends StatefulWidget {
  const PostInfoPage({super.key});

  @override
  State<PostInfoPage> createState() => _PostInfoPageState();
}

class _PostInfoPageState extends State<PostInfoPage> {
  bool isExperience = false; //virá por rota
  bool _isStarred = false;

  final TextEditingController _myCommentController = TextEditingController();

  void addOrRemoveToStarred() {
    setState(() {
      if (_isStarred == false) {
        _isStarred = true;
      } else {
        _isStarred = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: isExperience ? secondaryColor : primaryColor,
        elevation: 0.0,
        actions: <Widget>[
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            splashRadius: 24.0,
          ),
          IconButton(
            onPressed: _isStarred
                ? () => addOrRemoveToStarred()
                : () {
                    addOrRemoveToStarred();
                    infoSnackBar(
                      context,
                      "Post salvo!",
                      actionTitle: "Desfazer",
                      actionCallback: addOrRemoveToStarred,
                    );
                  },
            icon: Icon(
              Icons.bookmark,
              color: _isStarred ? secondaryColor : Colors.white,
            ),
            splashRadius: 24.0,
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
            splashRadius: 24.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          color: isExperience ? secondaryColor : primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                children: <Widget>[
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.person, color: Colors.white),
                    iconSize: 80.0,
                  ),
                  SizedBox(width: defaultSpacing),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Por: Denys Rafael Oliveira",
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        "Vaga no lab de bioinfo",
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(height: extraLargeSpacing, thickness: 2, color: Colors.white),
              SizedBox(
                height: height / 6,
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  overflow: TextOverflow.clip,
                ),
              ),
              const Divider(height: extraLargeSpacing, thickness: 2, color: Colors.white),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: height * .1,
        elevation: 8.0,
        color: Colors.white,
        padding: const EdgeInsets.all(defaultSpacing),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextFormField(
                controller: _myCommentController,
              ),
            ),
            const ElevatedButton(
              onPressed: null,
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              child: Icon(Icons.textsms),
            ),
          ],
        ),
      ),
    );
  }
}
