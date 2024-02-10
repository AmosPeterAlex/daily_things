import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Discover',
              style: TextStyle(
                  fontWeight: FontWeight.w700, letterSpacing: .2, fontSize: 30),
            ),
            Text(
              'News from all around the Globe',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  letterSpacing: .4,
                  wordSpacing: .1),
            ),
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width * .64,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Color(0xff6A3DE8), width: 3),
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
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xff6A3DE8),
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
                          title: provider.newsModel?.articles?[index].title ?? "",
                          description:
                              provider.newsModel?.articles?[index].description ??
                                  "",
                          date: provider.newsModel?.articles?[index].publishedAt,
                          imageUrl:
                              provider.newsModel?.articles?[index].urlToImage ??
                                  "",
                          contant:
                              provider.newsModel?.articles?[index].content ?? "",
                          sourceName:
                              provider.newsModel?.articles?[index].source?.name ??
                                  "",
                          url: provider.newsModel?.articles?[index].url ?? ""),
                      separatorBuilder: (context, index) =>
                          const Divider(height: 20),
                      itemCount: provider.newsModel?.articles?.length ?? 0),
            )
          ],
        ),
      ),
    );
  }
}
