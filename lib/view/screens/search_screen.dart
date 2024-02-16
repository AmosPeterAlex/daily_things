import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/search_screen_controller.dart';
import '../widgets/news_card.dart';

class SearchScreen extends StatefulWidget {
  // const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // const SearchScreen({super.key});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
      //extendBody: true,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'discover Things',
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '\t\t\t\t\t\t search ur things..',
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width * .74,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF9E8C9),
                      prefixIcon: Icon(Icons.search,color: Color(0xff1D24CA),size: 26,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.searchData(
                      searchText: textController.text.toLowerCase(),
                    );
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(color: Color(0xffF9E8C9), fontSize: 15),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xff1D24CA),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Provider.of<SearchScreenController>(context).isLoading ==
                      true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                          title:
                              provider.newsModel?.articles?[index].title ?? "",
                          description:
                              provider.newsModel?.articles?[index].description ??
                                  "",
                          date:
                              provider.newsModel?.articles?[index].publishedAt,
                          imageUrl:
                              provider.newsModel?.articles?[index].urlToImage ??
                                  "",
                          contant: provider.newsModel?.articles?[index].content ??
                              "",
                          sourceName:
                              provider.newsModel?.articles?[index].source?.name ??
                                  "",
                          url: provider.newsModel?.articles?[index].url ?? ""),
                      separatorBuilder: (context, index) => const Divider(height: 20),
                      itemCount: provider.newsModel?.articles?.length ?? 0),
            )
          ],
        ),
      ),
    );
  }
}
