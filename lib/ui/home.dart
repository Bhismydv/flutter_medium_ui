
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medium_ui/model/news_article.dart';
import 'package:flutter_medium_ui/model/news_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20)
          ),
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search Medium",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.grey,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20)
              )
            ),
          ),
        ),
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Image.asset("assets/download.png"),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(FontAwesomeIcons.edit, color: Colors.grey,),
              ),
              Text("Write", style: TextStyle(color: Colors.grey, fontSize: 14),)
            ],
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 5, left: 5),
              child: Icon(Icons.notifications_none, color: Colors.grey,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: PopupMenuButton(
                child: CircleAvatar(backgroundImage: AssetImage("assets/messi.png")),
                itemBuilder: (context)=><PopupMenuItem>[
                  PopupMenuItem(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.user, color: Colors.grey,),
                          SizedBox(width: 20,),
                          Text("Profile"),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.bookmarks_outlined, color: Colors.grey,),
                          SizedBox(width: 20,),
                          Text("Lists"),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.amp_stories_outlined, color: Colors.grey,),
                          SizedBox(width: 20,),
                          Text("Stories"),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.signal_cellular_alt, color: Colors.grey,),
                          SizedBox(width: 20,),
                          Text("Stats"),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Divider(),
                      SizedBox(height: 20,),
                    ],
                  ) ),
                  PopupMenuItem(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Settings"),
                      SizedBox(height: 20,),
                      Text("Refine recommendations"),
                      SizedBox(height: 20,),
                      Text("Manage publications"),
                      SizedBox(height: 20,),
                      Divider(),
                      SizedBox(height: 20,),
                    ],
                  )),
                  PopupMenuItem(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Became a member"),
                      SizedBox(height: 20,),
                      Text("Apply to the Partner Program"),
                      SizedBox(height: 20,),
                      Text("Gift a membership"),
                      SizedBox(height: 20,),
                      Divider(),
                      SizedBox(height: 20,),
                    ],
                  )),
                  PopupMenuItem(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign out"),
                      SizedBox(height: 10,),
                      Text("bhismydv2912@gmail.com"),
                      SizedBox(height: 20,),
                    ],
                  ))

                ]),
          ),

        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: NewsHelper.articleCount,
                  itemBuilder: (context, index){
                NewsArticle newsArticle = NewsHelper.getArticle(index);
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0.5, 0, 0.5),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/"+newsArticle.profileAssetName),
                                /*child: Image.asset("assets/"+newsArticle.profileAssetName,*/),
                              const SizedBox(width: 5,),
                              Text(newsArticle.author,
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: 14.0),),
                              Text(" · "+newsArticle.date,
                                style: const TextStyle(color: Colors.black38,fontWeight: FontWeight.w500, fontSize: 14.0),),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Flexible(
                               flex: 2,
                               child: RichText(
                                   text: TextSpan(
                                     text: newsArticle.title+"\n\n",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18.0),
                                 children: [
                                   TextSpan(
                                     text: newsArticle.categoryTitle,
                                     style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal, fontSize: 14.0),
                                   )
                                 ]
                               )),
                             ),
                              Flexible(
                                child: SizedBox(
                                  width: 90,
                                  height: 100,
                                  child: Image.asset("assets/"+newsArticle.imageAssetName,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              )
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(newsArticle.readTime,
                                style:const TextStyle(color: Colors.black45, fontWeight: FontWeight.w500),),
                              const Icon(Icons.bookmark_border)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              ),
             Padding(
               padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       color: Colors.black
                     ),
                     child: TextButton(
                         onPressed: (){},
                         child: Text("Get unlimited access", style: TextStyle(color: Colors.white),)
                     ),
                   ),
                   const SizedBox(height: 20,),
                   Text("2022 in Review",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(10),
                     child: Container(
                       width: MediaQuery.of(context).size.width,
                       height: 200,
                       child: ListView.separated(
                         separatorBuilder: (context, position){
                           return SizedBox(height: 10,);
                         },
                         padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                           itemCount: NewsHelper.Count,
                           itemBuilder: (context, position){
                             NewsArticle newsArticle = NewsHelper.getArticle(position);
                             return Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     CircleAvatar(
                                       backgroundImage: AssetImage("assets/"+newsArticle.profileAssetName),),
                                     const SizedBox(width: 5,),
                                     Text(newsArticle.author,
                                       style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: 16.0),),
                                   ],
                                 ),
                                 Text(
                                   newsArticle.title,
                                   maxLines: 2,
                                   overflow: TextOverflow.clip,
                                   style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18.0,
                                   ),
                                 )
                               ],
                             );
                           }
                       ),
                     ),
                   ),
                   const SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset("assets/download.png", width: 50,),
                       Icon(Icons.add, color: Colors.grey,),
                       Icon(FontAwesomeIcons.twitter, size: 50,color: Colors.blue,),
                     ],
                   ),
                   const SizedBox(height: 20,),
                   Text("Discover Medium writers you already follow on Twitter.",
                   textAlign: TextAlign.center,
                   maxLines: 2,
                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 18),),
                   const SizedBox(height: 20,),
                   Align(
                     alignment: Alignment.center,
                     child: Container(
                       width: MediaQuery.of(context).size.width/1.5,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                           border: Border.all(color:  Colors.grey),
                           color: Colors.white
                       ),
                       child: TextButton(
                           onPressed: (){},
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(FontAwesomeIcons.twitter),
                               const SizedBox(width: 10,),
                               Text("Connect to Twitter", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),),
                             ],
                           )
                       ),
                     ),
                   ), const SizedBox(height: 20,),
                  Divider(color: Colors.grey,),
                   const SizedBox(height: 10,),
                  Text("Who to follow",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   const SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, position){
                          return SizedBox(height: 10,);
                        },
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        itemCount: NewsHelper.Count,
                       // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, position){
                          NewsArticle newsArticle = NewsHelper.getArticle(position);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/"+newsArticle.profileAssetName),),
                              const SizedBox(width: 5,),
                              Text(newsArticle.author,
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18.0),),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 30,),
                               Flexible(
                                 child: Text(
                                   newsArticle.title,
                                   maxLines: 2,
                                   overflow: TextOverflow.clip,
                                   style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400, fontSize: 16.0,
                                   ),
                                 ),
                               ),
                             const SizedBox(width: 5,),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white
                                ),
                                child: TextButton(
                                    onPressed: (){},
                                    child: Text("Follow", style: TextStyle(color: Colors.black),)
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                    ),
                  ),
                  RichText(text: TextSpan(
                    text: "Reading list"+"\n\n",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "Click the Bookmark on any story to easily add it to your reading list or a custom list that you can share.",
                        style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400)
                      )
                    ]
                  )),
                  SizedBox(height: 10,),
                  Wrap(
                    children: [
                      Text("Help",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(width: 5,),
                      Text("Status",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(width: 5,),
                      Text("Writers",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(width: 5,),
                      Text("Blog",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(width: 5,),
                      Text("Careers",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(width: 5,),
                      Text("Privacy",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(width: 5,),
                      Text("Terms",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(width: 5,),
                      Text("About",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(width: 5,),
                      Text("Text to Speech",
                          style: TextStyle(color: Colors.grey, fontSize: 13))

                    ],
                  )
                 ],
               ),
             ),
            ],
          ),
        ),
      ),


    );
  }

}

