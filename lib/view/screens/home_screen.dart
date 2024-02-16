import 'package:daily_things/controller/home_screen_controller.dart';
import 'package:daily_things/view/widgets/new_news_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
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
  How to avoid calling this initstate
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
          ? Center(child: CircularProgressIndicator(color: Color(0xff201658),))
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ListView.separated(
                    itemBuilder: (context, index) => NewsCard1(
                          // some places it is ! and in some places it is ?
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
                              '',
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
                    separatorBuilder: (context, index) => Divider(
                          height: 15,
                      color: Color(0xff201658),
                        ),
                    itemCount: provider.newsModel.articles?.length ?? 0),
              ),
            ),
    );
  }
}
