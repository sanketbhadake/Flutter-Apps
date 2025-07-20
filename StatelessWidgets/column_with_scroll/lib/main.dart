import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Column Scroll",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    "https://images.unsplash.com/photo-1620435363451-b84b06e6de72?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlJTIwaW1hZ2VzfGVufDB8fDB8fHww"),
                Container(
                  height: 20,
                ),
                Image.network(
                    "https://bpac.in/wp-content/uploads/2021/08/BlogsArtboard-1-copy-9.jpg"),
                Container(
                  height: 20,
                ),
                Image.network(
                    "https://www.wallartprints.com.au/blog/wp-content/uploads/2017/10/hummingbird-nature-pictures-98278440.jpg"),
                Container(
                  height: 20,
                ),
                Image.network(
                    "https://t3.ftcdn.net/jpg/07/61/82/98/360_F_761829851_YXQUniyRbCfa9BBe3W1VMFQ4IeIgJkSu.jpg"),
                Container(
                  height: 20,
                ),
                Image.network(
                    "https://images.unsplash.com/photo-1620435363451-b84b06e6de72?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlJTIwaW1hZ2VzfGVufDB8fDB8fHww"),
                Container(
                  height: 20,
                ),
                Image.network(
                    "https://i.assetzen.net/i/k1RHLkFfW3kB/w:1200/h:/q:70.jpg"),
                Container(
                  height: 20,
                ),
                Image.network(
                    "https://i0.wp.com/picjumbo.com/wp-content/uploads/breathtaking-bali-nature-free-photo.jpg?w=600&quality=80"),
                Container(
                  height: 20,
                ),
                Image.network(
                    "https://www.treehugger.com/thmb/Y5reVpe2tn68Wqn4YQrO_e5vJQ0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2018__06__nature-phpoto-day-squirrel-6b50719b524c4ecbb3152a32baa38367.jpg"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
