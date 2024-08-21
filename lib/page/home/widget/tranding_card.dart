import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api_getx/const/colors.dart';
import 'package:news_app_api_getx/const/fonts.dart';

class TrandingCard extends StatefulWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const TrandingCard({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.time,
    required this.title,
    required this.author,
    required this.ontap,
  });

  @override
  State<TrandingCard> createState() => _TrandingCardState();
}

class _TrandingCardState extends State<TrandingCard> {
  final List<String> _images = [];

  @override
  Widget build(BuildContext context) {
    /*return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(5),
        // height: 300,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Theme.of(context).colorScheme.background,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    author[0],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    author,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );*/
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        width: 280,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.imageUrl),
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Add a gradient overlay for the shadow effect
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5), // Start with dark color
                    Colors.transparent, // Fade to transparent
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Content on top of the shadow
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        widget.author,
                        style: TextStyle(
                          fontFamily: RobotoR,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.verified,
                        size: 18,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: RobotoR,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    maxLines: 2, // Limits to two lines
                    overflow: TextOverflow.ellipsis,
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
