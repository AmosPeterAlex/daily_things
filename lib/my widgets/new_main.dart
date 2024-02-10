import 'package:daily_things/my%20widgets/new_news_card.dart';
import 'package:daily_things/view/widgets/news_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NewsCard1(
            title: 'aaaaaaaa ncjndsijncj wkcwkjn jncneik',
            description: 'jnjwn jne aaa ncjndsi cedid hcn eihbc hbhcbh nwmic jncjwk cwkjn jncnejd jnjned jnewi abcd efghi jklmn opqr stuv ',
            date: DateTime.timestamp(),
            imageUrl: 'https://dummyimage.com/600x400/000/fff',
            contant: 'conytent',
            sourceName: 'source name',
            url: 'url'),
      ),
    );
  }
}
