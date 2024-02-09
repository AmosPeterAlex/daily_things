import 'package:daily_things/controller/category_controller.dart';
import 'package:daily_things/view/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  // const CategoryScreen({super.key});
  // void fetchData(BuildContext context) async {
  //   Provider.of<CategoryScreenController>(context, listen: false).fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    // Provider.of<CategoryScreenController>(context, listen: false).fetchData();
    // fetchData(context);
    CategoryScreenController provider =
        Provider.of<CategoryScreenController>(context);
    return DefaultTabController(
      length: provider.categoryList.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cateogory Screen'),
          centerTitle: true,
          bottom: TabBar(
            // labelPadding: EdgeInsets.symmetric(),
            tabAlignment: TabAlignment.center,
            physics: BouncingScrollPhysics(),
            tabs: List.generate(
              provider.categoryList.length,
              (index) => Tab(
                text: provider.categoryList[index],
              ),
            ),
            onTap: (value) {
              provider.onTap(index: value);
            },
            isScrollable: true,
          ),
        ),
        body: Consumer<CategoryScreenController>(
          builder: (context, value, child) {
            value.fetchData();
            return value.isLoading == false
                ? CircularProgressIndicator()
                : ListView.separated(
                    itemCount: value.newsModel.articles?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) => NewsCard(
                        title:
                            value.newsModel.articles?[index].title.toString() ??
                                '',
                        description: value.newsModel.articles?[index].description
                                .toString() ??
                            '',
                        date: value.newsModel.articles?[index].publishedAt,
                        imageUrl: value.newsModel.articles?[index].urlToImage
                                .toString() ??
                            '',
                        contant: value.newsModel.articles?[index].content
                                .toString() ??
                            '',
                        sourceName: value.newsModel.articles?[index].source
                                .toString() ??
                            '',
                        url: value.newsModel.articles?[index].url.toString() ?? ''),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 10),
                  );
          },
        ),
      ),
    );
  }
}
