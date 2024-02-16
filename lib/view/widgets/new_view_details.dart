import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../controller/home_screen_controller.dart';

class NewsViewScreen1 extends StatelessWidget {
  const NewsViewScreen1(
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .5,
                  // color: Colors.teal,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 30,
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 25,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Tooltip(
                      message: 'Back',
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 70,
                  child: InkWell(
                    onTap: () {
                      Provider.of<HomeScreenController>(context, listen: false)
                          .launchURL(url);
                    },
                    child: Tooltip(
                      message: 'Go to Website',
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        child: Icon(
                          CupertinoIcons.globe,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 15,
                  child: InkWell(
                    onTap: () {
                      String newsToShare = '$title\n $description \n$url';
                      Provider.of<HomeScreenController>(context, listen: false)
                          .shareText(textToShare: newsToShare);
                    },
                    child: Tooltip(
                      message: 'Share news',
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        child: Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${DateFormat('dd/MM/yyyy').format(date!).toString() ?? ""}'),
                  Text(sourceName)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      contant,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
