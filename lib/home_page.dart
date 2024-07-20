import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_daily/components/custom_curved_appbar.dart';
import 'package:news_daily/news_detail_page.dart';
import 'package:news_daily/providers/home_provider.dart';
import 'package:news_daily/settings_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
        },
        backgroundColor: const Color.fromARGB(255, 93, 138, 221),
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
      appBar: CustomCurvedAppbar(
      title: "Newsflash",
      isTitleCenter: true,
      showBackIcon: false,
      ),
      body:Column(
           mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
      
          SizedBox(height: 15,),
  
        
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 15.0),
              child: Consumer<HomeProvider>(
                builder: (context,hp,child) {
                  return ListView.builder(
                      itemCount:hp.newsAritcles.length,
               
                      physics:  BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewsDetailScreen(newsData:hp.newsAritcles[index])));
                            },
                            child: Material(
                              elevation: 4,
                               borderRadius: const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(color: const Color.fromARGB(255, 190, 187, 187))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                    
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                       
                                          
                                            child: ClipRRect(
                                                             borderRadius: BorderRadius.all(
                                                     Radius.circular(20)
                                                        ),
                                                          child: CachedNetworkImage(
                                      imageUrl: hp.newsAritcles[index].urlToImage??"",fit: BoxFit.cover,
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                             ),
                                                        ),
                                          ),
                                            
                                          SizedBox(width: 10,),
                                          Expanded(child: Text(hp.newsAritcles[index].title??"",maxLines: 4,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          )),
                                        ],
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        );
                      });
                }
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}