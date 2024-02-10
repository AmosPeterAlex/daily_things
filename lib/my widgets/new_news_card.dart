import 'package:daily_things/my%20widgets/new_view_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/home_screen_controller.dart';

class NewsCard1 extends StatelessWidget {
  const NewsCard1(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.imageUrl,
      required this.contant,
      required this.sourceName,
      required this.url});

  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String contant;
  final String sourceName;
  final String url;

  @override
  Widget build(BuildContext context) {
    var devWidth = MediaQuery.of(context).size.width;
    return InkWell(
      /// Sliver Screen vilikam
      /// onLongPress: share option evde akam,
      /// onTap: navigate to nxt page,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsViewScreen1(
                title: title,
                description: description,
                imageUrl: imageUrl,
                contant: contant,
                sourceName: sourceName,
                url: url)));
      },
      onLongPress: () {
        String newsToShare = '$title\n $description \n$url';
        Provider.of<HomeScreenController>(context, listen: false)
            .shareText(textToShare: newsToShare);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: devWidth / 3,
        width: devWidth,
        // padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // color: Colors.red,
              height: devWidth / 3,
              width: devWidth / 3,
              child: Center(
                child: Text('Image'),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: devWidth * (2 / 3),
                  width: devWidth * (2 / 3),
                  // color: Colors.blue,
                ),

                // Text('Sourcename'),
                Positioned(
                  top: 5,
                  child: Text(
                    maxLines: 5,
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(bottom: 5, left: 1, child: Text(sourceName)),
                Positioned(bottom: 5, left: 95, child: Text(sourceName)),
                //edh author kk vndi refractor chyanm or delete akenm
                Positioned(
                    bottom: 5,
                    right: 1,
                    child: Text(
                        " ${DateFormat('dd/MM/yyyy').format(date!).toString() ?? ""}")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
