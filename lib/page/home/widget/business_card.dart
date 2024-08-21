import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api_getx/const/fonts.dart';

class BusinessCard extends StatefulWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const BusinessCard({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.time,
    required this.title,
    required this.author,
    required this.ontap,
  });

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
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
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.imageUrl),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 234,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: RobotoR,
                      fontSize: 17,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: 234,
                  child: Text(
                    widget.author,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
