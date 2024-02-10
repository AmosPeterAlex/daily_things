import 'package:daily_things/controller/home_screen_controller.dart';
import 'package:daily_things/view/widgets/news_card.dart';
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
        appBar: AppBar(
          title: Text('daily Things',style: GoogleFonts.lato(color: Colors.black,fontSize: 22),),
          // title: RichText(
          //   text: TextSpan(
          //     children: [
          //       TextSpan(
          //         text: 'daily ', // Text with one font
          //         style: GoogleFonts.sacramento(
          //           textStyle: TextStyle(
          //             fontSize: 24,
          //             fontWeight: FontWeight.w500,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //       TextSpan(
          //         text: 'Things', // Text with another font
          //         style: GoogleFonts.oswald(
          //           textStyle: TextStyle(
          //             fontSize: 24,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // centerTitle: true,
          toolbarHeight: 110,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700),
          // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          /*
          Rich text oke veruna kurach kudi clean aya ui design akenm
           */
        ),
        body: Provider.of<HomeScreenController>(context).isLoading == true
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(10),
                child: ListView.separated(
                    itemBuilder: (context, index) => NewsCard(
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
                          height: 20,
                        ),
                    itemCount: provider.newsModel.articles?.length ?? 0)));
  }
}
