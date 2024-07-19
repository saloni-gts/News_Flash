import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
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
    return const SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            "Nowadays, almost every application has a dark theme feature, for example, YouTube, WhatsApp, and Instagram. Some of them have a  toggle button in their app to on/ off the dark theme and others check theme settings in the device and display the selected theme. So in this blog let’s check how to implement the dark theme in the flutter.",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
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
