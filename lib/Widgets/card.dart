// import 'package:alok/models/banner.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../constants/colors.dart';





// class HomeBanner extends StatefulWidget {
//   HomeBanner({Key? key}) : super(key: key);

//   @override
//   State<HomeBanner> createState() => _HomeBannerState();
// }

// class _HomeBannerState extends State<HomeBanner> {
//   int activeIndex = 0;

//   setActiveDot(index) {
//     setState(() {
//       activeIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//   return StreamBuilder(
//     stream: FirebaseFirestore.instance.collection('Card').orderBy("num", descending: false).snapshots(),
//     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if(snapshot.hasData){
//       return Column(
//         children: snapshot.data!.docs.map(
//         (DocumentSnapshot document){
//         banner bannerList = banner.fromFirestore(document);
//         return 
        
//         slider(items: bannerList);
//             }
//           ).toList(),
          
//         );
//       } 
//     else{
//       return SizedBox(height: 100,);
//     }
//   });
// }}

// class slider extends StatefulWidget {
//   final items;
//   slider({required this.items,Key? key}) : super(key: key);

//   @override
//   State<slider> createState() => _sliderState();
// }

// class _sliderState extends State<slider> {
//   int activeIndex = 0;

//   setActiveDot(index) {
//     setState(() {
//       activeIndex = index;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       child: CarouselSlider(
//         options: CarouselOptions(
//           autoPlayInterval: Duration(seconds: 5),
//           autoPlay: true,
//           height: 180,
//           autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//           autoPlayAnimationDuration: Duration(seconds: 2),
//           viewportFraction: 1,
//           onPageChanged: (index, reason) {
//             setActiveDot(index);
//           },
//         ),
//         items: List.generate(
//           1,
//           (index) {
//             return 
//             CachedNetworkImage(
//                               imageUrl: widget.items.Img,
//                               imageBuilder: (context, imageProvider) =>
//                                   Container(
//               margin: EdgeInsets.only(left: 2, right: 0),
//               decoration: BoxDecoration(
//                 color: white,
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: imageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//                               placeholder: (context, url) => Container(
//                                 height: 150,
//                                 width: 100,
//                                 decoration: BoxDecoration(
//                                   // color: Colors.orange.shade300,
//                                 ),
//                               ),
//                               errorWidget: (context, url, error) =>
//                                   Container(
//                                 width: 50.0,
//                                 height: 50.0,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     width: 2,
//                                     color: Theme.of(context)
//                                         .scaffoldBackgroundColor,
//                                   ),
//                                   image: const DecorationImage(
//                                     image: AssetImage(
//                                       'assets/1024.png',
//                                     ),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             );

            
//           },
//         ),
//       ),
//     );
//   }
// }


import 'package:alok/Widgets/slider/custom_slider.dart';
import 'package:alok/constants/image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CarouselExample extends StatefulWidget {
  @override
  _CarouselExampleState createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    getImageUrls();
  }

  getImageUrls() async {
    final CollectionReference imagesCollection = FirebaseFirestore.instance.collection('Card');
    QuerySnapshot snapshot = await imagesCollection.get();
    List<DocumentSnapshot> documents = snapshot.docs;
    for (var document in documents) {
      imageUrls.add(document.get("Img"));
    }
    setState(() {});
  }

  int activeIndex = 0;

  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    return Stack(
      
      alignment: Alignment.topCenter,
      children: [
        Container(
          
          height: 200.0,
          child: CarouselSlider(
            items: imageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return 
                  
                  CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                  margin: EdgeInsets.only(left: 2, right: 0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                                  placeholder: (context, url) => Container(
                                    height: 150,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      // color: Colors.orange.shade300,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      image:  DecorationImage(
                                        image: AssetImage(
                                          image
                                          // 'assets/1024.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                },
              );
            }).toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setActiveDot(index);
              },
              height: 180,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Positioned(
          bottom: 26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imageUrls.length,
              (idx) {
                return activeIndex == idx ? ActiveDot() : InactiveDot();
              },
            ),
          ),
        ),
      ],
    );
  }
}
