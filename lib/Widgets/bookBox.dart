



import 'package:alok/constants/image.dart';
import 'package:alok/content/bookPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Widget bookBox({required BuildContext context, required featured ,required name,required bookmark,required pdf,required description,required listen,required id,required read,required aboutAuthor, required img, required publisher, required credits})=> InkWell(
            child: 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: 
                  Music(
                    name: name,
                    bookmark : bookmark,
                    pdf: pdf,
                    img: img,
                    description: description,
                    id: id, listen: listen,read: read,
                    author: aboutAuthor,
                    Publisher: publisher,
                    
                    credits:credits
                    )
                  ));


                },
                child: CachedNetworkImage(
                                  imageUrl: img,
                                  imageBuilder: (context, imageProvider) =>
                                      Material(
                                        elevation: 20,
                                        child: Container(
                                          
                                                                          width: 120,
                                                                          height: 200,
                                                                          decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(10),
                                                                        shape: BoxShape.rectangle,
                                                      image: 
                                                      
                                                      DecorationImage(
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
              ),
            ),
            // onTap: (){

            // },  
          );
