import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class StackWidget extends StatelessWidget {
  final String imageCover;
  final String serieName;
  final String serieDesc;
  final String year;
  final Widget listEpisodes;
  final String count;
  final String url;
  // final String publisherName;

  const StackWidget({
    Key? key,
    required this.imageCover,
    required this.serieName,
    required this.serieDesc,
    required this.year,
    required this.count,
    required this.listEpisodes,
    required this.url,
    // required this.publisherName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageCover,
              ),
            ),
          ),
        ),
        Container(
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(0xff121212),
                Colors.transparent,
              ],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: size.height,
            minWidth: size.width,
          ),
          width: size.width,
          decoration: BoxDecoration(
            color: const Color(0xff121212).withOpacity(0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        serieName,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        shape: const CircleBorder(),
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.blueGrey[100],
                      ),
                      onPressed: () {
                        Get.toNamed(
                          '/detail/serie',
                          arguments: url,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 0,
                ),
                child: Text(
                  year,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Html(
                      data: serieDesc,
                      tagsList: Html.tags..remove('img'),
                      style: {
                        "p": Style(color: Colors.white),
                        "h1": Style(color: Colors.white),
                        "h2": Style(color: Colors.white),
                        "h3": Style(color: Colors.white),
                        "h4": Style(color: Colors.white),
                        "ul": Style(color: Colors.white),
                        "li": Style(color: Colors.white),
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Lista de episodios ($count)",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
                child: listEpisodes,
              ),
            ],
          ),
        )
      ],
    );
  }
}
