import 'package:flutter/material.dart';

import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/routes/routes_consts.dart';

class FeedItemCard extends StatelessWidget {
  const FeedItemCard({
    Key? key,
    required this.title,
    this.description,
    required this.isOportunity,
  }) : super(key: key);

  final String title;
  final String? description;
  final bool isOportunity;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: defaultSpacing),
      child: InkWell(
        onTap: () => Navigator.of(context).popAndPushNamed(RoutesConsts.postInfo),
        child: Container(
          padding: const EdgeInsets.all(minorSpacing),
          width: width,
          height: height / 5,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.elliptical(8, 8)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: isOportunity ? [primaryColor, Colors.blue.shade800] : [secondaryColor, Colors.amber.shade400],
            ),
          ),
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.person,
                size: 80.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 2,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: minorSpacing),
                    Expanded(
                      child: Text(
                        description != null ? description! : "",
                        maxLines: 5,
                        style: const TextStyle(
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
      ),
    );
  }
}
