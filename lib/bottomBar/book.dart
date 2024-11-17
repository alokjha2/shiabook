


import 'package:alok/constants/image.dart';
import 'package:alok/content/bookPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

Widget bookCard({required BuildContext context, required publisher, required credits, required name, required bookmark, required pdf, required img, required description, required id, required listen, required read, required aboutAuthor, required featured})=> Padding(
    padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
    child: InkWell(
      onTap: (){
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: 
              Music(
                Publisher: publisher,
                credits: credits,
                name: name,
                bookmark : bookmark,
                pdf: pdf,
                img: img,
                description: description,
                id: id, listen: listen,read: read,
                author: aboutAuthor,
                )
                    )
                  );
                },
            child: Card(
              elevation: 4,
              shadowColor: Colors.white60,
              child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                     color: Color(0XFFFAFA),
                       borderRadius: BorderRadius.circular(5),
              shape: BoxShape.rectangle,
              ), 
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CachedNetworkImage(
                imageUrl: img,
                imageBuilder: (context, imageProvider) =>
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 100,
                        height: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10), 
                            bottomRight: Radius.circular(10)
                            ),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                placeholder: (context, url) => Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade300,
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
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    image:  DecorationImage(
                      image: AssetImage(
                        image
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width /1.6,
                    child: Text(
                      name, style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 17,overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500)),)),

                  // SizedBox(height: 2,),

                  SizedBox(
                    height: 60,
                    
                    width: MediaQuery.of(context).size.width /2,
                    child: Text(description, style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                ],
              ),
                  ],
                ),
              ),
            ),
          ),
        );