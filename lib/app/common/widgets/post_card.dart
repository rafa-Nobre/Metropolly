import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/routes/routes_consts.dart';

class FeedItemCard extends StatelessWidget {
  const FeedItemCard({super.key});

  final bool _isNormalPost = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(RoutesConsts.postInfo),
      child: Container(
        padding: const EdgeInsets.all(minorSpacing),
        width: width,
        height: height / 5,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(8, 8)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: _isNormalPost ? [primaryColor, Colors.blue.shade800] : [secondaryColor, Colors.amber.shade400],
          ),
        ),
        child: const Row(
          children: <Widget>[
            Icon(
              Icons.person,
              size: 80.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Vaga de bolsa",
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: minorSpacing),
                  Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea.",
                      style: TextStyle(
                        fontSize: 16.0,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
