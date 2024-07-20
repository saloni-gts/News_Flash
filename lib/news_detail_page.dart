import 'package:flutter/material.dart';
import 'package:news_daily/api/news_data_model.dart';
import 'package:news_daily/constants/app_images.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
class NewsDetailScreen extends StatefulWidget {
  Articles? newsData;
   NewsDetailScreen({super.key, this.newsData});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
void initState() {
  print("WIDGET DATA ---${widget.newsData}");
  print("WIDGET DATA ---${widget.newsData?.title}");
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 138, 221),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * .40,
                  width: double.infinity,
                  child: 
                  
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child:ClipRRect(
                         borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                      child: CachedNetworkImage(
                            imageUrl: widget.newsData?.urlToImage??"",fit: BoxFit.fill,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                         ),
                    ),
                  
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 8,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 125, 153, 206),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
            _buidldBG(child: _buildBody())
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return  SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            widget.newsData?.title??"",
            style: TextStyle(fontSize:32, color: Colors.white,fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 15,),
 Text(
            widget.newsData?.description??"",
            style: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.w700),
          ),   SizedBox(height: 15,),
          Text(
            widget.newsData?.content??"",
            style: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.w700),
          ),SizedBox(height: 15,),


          TextButton(onPressed: () async {
             if (!await launchUrl(Uri.parse(widget.newsData?.url??""))) {
    throw Exception('Could not launch');
  }
          }, child: Text("Read More",
            style: TextStyle(fontSize: 18, color: Colors.white,fontStyle: FontStyle.italic,decoration:TextDecoration.underline ),
          ))
        ],
      ),
    ));
  }

  Widget _buidldBG({Widget? child}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: context.height * .67,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 93, 138, 221),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
