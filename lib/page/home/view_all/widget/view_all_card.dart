import 'package:flutter/material.dart';
import 'package:news_app_api_getx/const/fonts.dart';

class ViewAllCard extends StatefulWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const ViewAllCard(
      {super.key,
      required this.imageUrl,
      required this.tag,
      required this.time,
      required this.title,
      required this.author,
      required this.ontap});

  @override
  State<ViewAllCard> createState() => _ViewAllCardState();
}

class _ViewAllCardState extends State<ViewAllCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: 330,
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
