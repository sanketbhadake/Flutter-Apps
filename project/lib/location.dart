import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/homePage.dart';

class SelectCityPage extends StatefulWidget {
  const SelectCityPage({super.key});

  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  TextEditingController textEditingController = TextEditingController();
  List<dynamic> location = [
    {
      "city": [
        'Mumbai',
        'Pune',
        'Delhi',
        'Bangalore',
        'Hyderabad',
        'Chennai',
      ],
      "image": [
        Image.asset("assets/mumbai.png", fit: BoxFit.cover),
        Image.asset("assets/pune.jpg", fit: BoxFit.cover),
        Image.asset("assets/delhi.png", fit: BoxFit.cover),
        Image.asset("assets/bangalore.jpg", fit: BoxFit.cover),
        Image.asset("assets/hyderabad.png", fit: BoxFit.cover),
        Image.asset("assets/chennai.png", fit: BoxFit.cover),
      ],
    },
    {
      'city': [
        'Ghaziabad',
        'Kolkata',
        'Secunderabad',
        'Coimbatore',
        'Kanpur',
        'Jaipur',
        'Chennai',
        'Thane',
        'Jodhpur',
        'Surat',
        'Navi Mumbai',
        'Greater Noida',
        'Bhopal',
        'Lucknow',
        'Ranchi',
        'Nagpur',
        'Nanded',
        'Chandigarh',
        'Patna',
      ],
    }
  ];

  void onCityTap(String cityName) {
    print("Selected city: $cityName");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Select City",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Popular Cities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onCityTap(location[0]['city'][index]),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  title: location[0]['city'][index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red[100],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              child: location[0]['image'][index],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          location[0]['city'][index],
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "All Cities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 19,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onCityTap(location[index]),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    title: location[1]['city'][index],
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              location[1]['city'][index],
                              style: GoogleFonts.inter(fontSize: 18),
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
