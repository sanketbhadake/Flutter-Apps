// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class FirebaseHelper {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// //   // Add a favorite item to Firebase Firestore
// //   Future<void> addFavorite(String name, String image, String price) async {
// //     try {
// //       await _firestore.collection('favorites').add({
// //         'name': name,
// //         'image': image,
// //         'price': price,
// //         'timestamp': FieldValue.serverTimestamp(),
// //       });
// //     } catch (e) {
// //       print('Error adding favorite: $e');
// //     }
// //   }

// //   // Get all favorite items from Firestore
// //   Future<List<Map<String, dynamic>>> getFavorites() async {
// //     try {
// //       QuerySnapshot snapshot = await _firestore.collection('favorites').get();
// //       return snapshot.docs
// //           .map((doc) => doc.data() as Map<String, dynamic>)
// //           .toList();
// //     } catch (e) {
// //       print('Error getting favorites: $e');
// //       return [];
// //     }
// //   }
// // }
// import 'package:firebase_database/firebase_database.dart';
// import 'package:project/favourite_model.dart';

// final databaseReference = FirebaseDatabase.instance.ref();

// Future<void> addFavoriteToFirebase(FavoriteCookie cookie) async {
//   final newFavoriteRef = databaseReference.child('favorites').push();
//   await newFavoriteRef.set(cookie.toMap());
// }

// Future<List<FavoriteCookie>> getFavoritesFromFirebase() async {
//   final snapshot = await databaseReference.child('favorites').get();
//   if (snapshot.exists) {
//     final List<FavoriteCookie> favorites = [];
//     final data = snapshot.value as Map;
//     data.forEach((key, value) {
//       favorites.add(FavoriteCookie.fromMap(value));
//     });
//     return favorites;
//   } else {
//     return [];
//   }
// }
