import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawerEnableOpenDragGesture: false,
          appBar: AppBar(
            title: Image.network(
              height: 100,
              width: 220,
              "https://images.ctfassets.net/y2ske730sjqp/1aONibCke6niZhgPxuiilC/2c401b05a07288746ddf3bd3943fbc76/BrandAssets_Logos_01-Wordmark.jpg?w=940",
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            actions: [
              Icon(
                Icons.search,
                color: Colors.white,
              )
            ],
          ),
          body: Container(
            color: const Color.fromARGB(255, 26, 16, 16),
            child: ListView.builder(
                itemCount: 1,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Action Movies",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://media0058.elcinema.com/uploads/_315x420_d226612ecee38df26832c6105180265c339ce006bd06fa3a507cec15d5fe4a98.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS17JGDA1JekAu7dElVKIe6Pg3ybMK5SC1RFQ&s",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://1.bp.blogspot.com/-DgcNetYvpcs/XcpPnCdmNTI/AAAAAAABD-8/h8qQCqBcbrECz0x3p6O5KXk9XALi0Fi1ACLcBGAsYHQ/s1600/tanhaji-movie-poster.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtaa2p4LpzPI9e3_bP82fGERu2NSgWGy5NedDUxnn6pwzS7KQqBctshkwrEYJhm236Bhk&usqp=CAU",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://m.media-amazon.com/images/I/91zOCNs+x-L.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "South Movies",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              // padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/en/5/53/Master_2021_poster.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              // padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://stat4.bollywoodhungama.in/wp-content/uploads/2023/04/Pushpa-2-%E2%80%93-The-Rule.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              // padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://static.toiimg.com/photo/61259441.cms",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              // padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://upload.wikimedia.org/wikipedia/en/thumb/d/d7/RRR_Poster.jpg/220px-RRR_Poster.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Webseries",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              // padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://rukminim2.flixcart.com/image/850/1000/l0h1g280/poster/1/m/t/small-mirzapur-web-series-poster-multicolor-photopaper-print-12-original-imagc95bfufzrhw8.jpeg?q=90&crop=false",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              // padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://m.media-amazon.com/images/M/MV5BNGRkOTVjODgtNTBmZS00MDQ3LWE3ZjQtM2ZiNDQ3OWJkMjM2XkEyXkFqcGc@._V1_.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              // padding: const EdgeInsets.all(5),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXeY0DrjlIExbvkmPmvCgbeXa9su4x349oHJDYNeXjJMCI9-Kl8MikoEErOkCMUn89GPs&usqp=CAU",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              // padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 10),
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScOZWXKNrIVy7FgEJIC7BBiv975F1bziqotw&s",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ));
  }
}
