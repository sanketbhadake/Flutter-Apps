import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Searchscreen extends StatefulWidget {
  final Map movie;
  const Searchscreen({super.key, required this.movie});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  List searchResults = [];

  Future<void> searchMovies(String query) async {
    final response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    if (response.statusCode == 200) {
      setState(() {
        searchResults = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to search movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search, color: Colors.white),
              hintText: 'Search Movies...',
              fillColor: Colors.white,
              hoverColor: Colors.white,
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white)),
          onSubmitted: (query) {
            searchMovies(query);
          },
        ),
        backgroundColor: const Color.fromARGB(186, 0, 0, 0),
      ),
      body: Container(
        color: Colors.black,
        child: searchResults.isEmpty
            ? const Center(
                child: Text(
                'No Results Found',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ))
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final movie = searchResults[index]['show'];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Searchscreen(movie: movie),
                          ),
                        );
                      },
                      child: Expanded(
                        flex: 0,
                        child: Container(
                          height: 260,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    height: 200,
                                    child: movie['image'] != null
                                        ? Image.network(
                                            movie['image']['medium'])
                                        : const Icon(
                                            Icons.image,
                                            size: 140,
                                          ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: 200,
                                        child: Text(
                                          movie['name'] ?? 'No Title',
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      // flex: 0,
                                      child: SizedBox(
                                        width: 230,
                                        child: Center(
                                          child: Text(
                                            movie['summary']?.replaceAll(
                                                    RegExp(r'<[^>]*>'), '') ??
                                                'No Summary',
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
