import 'package:daily_things/controller/home_screen_controller.dart';
import 'package:daily_things/view/widgets/new_news_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
   // HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({super.key});

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  /*
  How to avoid calling this initState
   */

  void fetchData() async {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'daily Things',
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              '\t\t\t\t\t\t\tthings to think..',
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
            )
          ],
        ),
        toolbarHeight: 100,
      ),
      body: Provider.of<HomeScreenController>(context).isLoading == true
          ?  Center(
              child: CircularProgressIndicator(
                color: Color(0xff201658),
              ),
            )
          : Padding(
            padding:  EdgeInsets.all(5),
            child: ListView.separated(
                itemBuilder: (context, index) => NewsCard1(
                      title: provider.newsModel.articles![index].title
                          .toString(),
                      // title: provider.newsModel.articles?[index].title
                      //     .toString() ?? '',
                      description: provider
                              .newsModel.articles?[index].description
                              .toString() ??
                          '',
                      date: provider.newsModel.articles![index].publishedAt,
                      imageUrl: provider
                              .newsModel.articles?[index].urlToImage
                              .toString() ??
                          'data:image/png;base64,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',
                      contant: provider.newsModel.articles?[index].content
                              .toString() ??
                          '',
                      sourceName: provider
                              .newsModel.articles?[index].source!.name
                              .toString() ??
                          '',
                      url: provider.newsModel.articles?[index].url
                              .toString() ??
                          '',
                    ),
                separatorBuilder: (context, index) => const Divider(
                      height: 15,
                      color: Color(0xff201658),
                    ),
                itemCount: provider.newsModel.articles?.length ?? 0),
          ),
    );
  }
}
