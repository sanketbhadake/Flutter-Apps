import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api_response.dart';
import 'package:news_app/api_service.dart';
import 'package:news_app/detail_news.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});
  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late Future<ApiResponse> _newsFuture;
  bool _isTextFieldVisible = false;
  String searchString = 'India';

  @override
  void initState() {
    super.initState();
    _newsFuture = NewsService().fetchNews(searchString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(174, 0, 0, 0),
        title: Text(
          'News App',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isTextFieldVisible = !_isTextFieldVisible;
              });
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: FutureBuilder<ApiResponse>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color:   Color.fromARGB(174, 0, 0, 0),
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final articles = snapshot.data!.articles;
            return Column(
              children: [
                if (_isTextFieldVisible)
                  Positioned(
                    top: kToolbarHeight,
                    left: 20,
                    right: 20,
                    child: Card(
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration:
                              const InputDecoration(hintText: 'Type Here..'),
                          onSubmitted: (value) => setState(() {
                            _newsFuture = NewsService().fetchNews(value);
                          }),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedNewsView(
                                article: article,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                        child: article.urlToImage != null
                                            ? Image.network(
                                                '${article.urlToImage}',
                                                height: 200,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                "https://thumbs.dreamstime.com/b/image-not-available-icon-set-default-missing-photo-stock-vector-symbol-black-filled-outlined-style-no-found-white-332183016.jpg",
                                                height: 200,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              )),
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              175, 0, 0, 0),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          '${article.sourceName}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Content section
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${article.title}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Written By ${article.author}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(
                                              Icons.edit_calendar_outlined,
                                              size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            "${article.sourceName} • ${article.publishedAt}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
