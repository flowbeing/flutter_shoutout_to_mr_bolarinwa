import "dart:math";
import 'dart:ui';
import "package:flutter/material.dart";

import "../widgets/secondary/add_list_item_widget.dart";
import "../helpers/height_width_relative_percentage.dart";

enum Car {
  red,
  green,
  blue
}

class Homepage extends StatefulWidget{

  String someString = "someString";

  @override
  State<StatefulWidget> createState(){
    return HompageState();
  }
}

class HompageState extends State<Homepage>{

  MediaQueryData? mediaQuery;

  bool isTapped = false;
  double? paddingTop;
  double? deviceHeight;
  double? deviceWidth;

  Map<String, String> listOfListItemContent = {
    "May 6:": "Luke 6:38 - Reciprocity",
    "May 5:": "Aye Ole - Infinity 💰",
    "May 4:": "God Bless You! 💐🥂",
    "initial": "1",
  };

  @override
  void initState(){

    super.initState();
    print("initState");

  }

  @override
  void didChangeDependencies(){
    mediaQuery = MediaQuery.of(context);
    paddingTop = mediaQuery!.padding.top;
    deviceHeight = mediaQuery!.size.height;
    deviceWidth = mediaQuery!.size.width;
  }

  Widget build(BuildContext context){

    print("built widget");

    print('padding-top: ${paddingTop}');
    print('deviceHeight: ${deviceHeight}');
    print("deviceWidth: ${deviceWidth}");


    // print("padding: ${MediaQuery.of(context).padding.top}");
    // print("size: ${MediaQuery.of(context).size.height}");
    /// calculating relative height and width
    /// *improve
    Map sizeRatio = heightWidthRelativePercentage(
        context: context,
        widthVal: 10,
        heightVal: 10
    );

    return Scaffold(
        appBar: null,
        // AppBar(
        //   backgroundColor: Colors.blueAccent,
        //   elevation: 0,
        // ),
        // backgroundColor: Colors.white70,
        body: Container(
          width: deviceWidth,
          padding: EdgeInsets.fromLTRB(
              0,
              paddingTop! + (sizeRatio['height'] * deviceHeight!), // + 10px
              0,
              0
          ),
          // color: Colors.blue,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  /// Top Container with Ink Well Effect
                  AddItemToListWidget(),

                  ///
                  // Padding(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 0.0233 * deviceHeight!
                  //     ),
                  // ),

                  /// AI image Container
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.fromLTRB(0, 0.023 * deviceHeight!,0,0), // 0.0466
                    padding: EdgeInsets.all(
                        0.0233 * deviceHeight!
                    ),
                    height: .475 * MediaQuery.of(context).size.height,
                    width: .85 * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // color: Colors.blueAccent.withRed(100),
                      border: Border.all(
                        color: Colors.transparent,
                        width: .3
                      ),
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent.withRed(80), // Colors.blueAccent.withOpacity(.5),
                          Colors.blueAccent.withRed(130) // Colors.blueAccent.withOpacity(0.01)
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft
                      )
                    ),
                    /// Card Content & WaterMark Holders
                    child: Column(
                      children: [
                        /// Card Content Holder
                        Expanded(
                          flex: 93,
                          /// A column of text boxes
                          child: Container(
                            // color: Colors.black,
                            padding: EdgeInsets.only(
                                top: 0.05 * deviceHeight!
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                TextContentContainer(
                                    textContent: "A BIG SHOUTOUT TO YOU",
                                    deviceHeight: deviceHeight
                                ),

                                TextContentContainer(
                                    textContent: "FOR ALL YOUR PRAYERS!",
                                    deviceHeight: deviceHeight
                                ),

                                TextContentContainer(
                                    textContent: "MR BOLARINWA",
                                    deviceHeight: deviceHeight,
                                    isRemoveBox: true,
                                )
                              ]
                            ),
                          )
                        ),

                        /// WaterMark Holder
                        WatermarkHolder(),

                      ],
                    ),
                  ),

                  Container(
                    // color: Colors.deepOrangeAccent,
                    height: deviceHeight! * .5,
                    width: .85 * MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        padding: EdgeInsets.only(
                            top: 0.03 * deviceHeight!,
                            left: 0,
                            right: 0,
                            bottom: 0
                        ),
                        itemCount: 3,
                        itemBuilder: (context, index){
                          String currentKey = listOfListItemContent.keys.toList()[index];
                          print("currentKey: ${currentKey}, ${currentKey.runtimeType}");

                          return CustomListTile(
                              leading: currentKey,
                              content: listOfListItemContent[currentKey]!,
                              deviceHeight: deviceHeight
                          );
                        }
                    ),
                  )

                  // Padding(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 0.0233 * deviceHeight!
                  //     ),
                  //     child: const Divider()
                  // ),

                  /// CONTINUE FROM HERE!
                  // const TextField(
                  //   autofocus: true,
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //
                  //   )
                  // )

                ]
            ),
          ),
        )
    );

  }

}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.leading,
    required this.deviceHeight,
    required this.content,
  }) : super(key: key);

  final double? deviceHeight;
  final String leading;
  final String content;

  @override
  Widget build(BuildContext context) {
    print("title: ${leading}");
    return Padding(
      padding: EdgeInsets.only(
        bottom: 0.023 * deviceHeight!
      ),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.blueAccent,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6)
          ),
        ),
        // tileColor: Colors.deepOrange,
        leading: Text(
          leading,
          style: const TextStyle(
            fontFamily: "SpaceMono",
            fontWeight: FontWeight.w700,
            fontSize: 16
          ),
        ),

        title: Text(
          content,
          style: const TextStyle(
              fontFamily: "SpaceMono",
              fontWeight: FontWeight.w700,
              fontSize: 16
          ),
        ),
      ),
    );
  }
}

/// Text Content Container
class TextContentContainer extends StatelessWidget {
  const TextContentContainer({
    Key? key,
    required this.deviceHeight,
    required this.textContent,
    this.isRemoveBox = false,
  }) : super(key: key);

  final double? deviceHeight;
  final String textContent;
  final bool isRemoveBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: deviceHeight! * .06,
      margin: EdgeInsets.only(
        bottom: 0.0233 * deviceHeight!
      ),
      decoration: BoxDecoration(
        color: isRemoveBox == false ? Colors.black.withOpacity(.09) : Colors.transparent,
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text(
        textContent,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "SpaceMono",
          fontSize: 19,
          fontWeight: FontWeight.bold,
          letterSpacing: .2
        ),

      )
    );
  }
}

/// Watermark Holder - A&C
class WatermarkHolder extends StatelessWidget {
  const WatermarkHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        alignment: Alignment.centerLeft,
        // decoration: const BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.horizontal(
        //       right: Radius.circular(5))
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2.5),
          child: CircleAvatar(
            backgroundColor: Colors.deepOrangeAccent,
            foregroundColor: Colors.deepOrangeAccent,
            radius: 12,
            child: Image.asset(
              "assets/images/watermark.png",
              // color: Colors.white.withOpacity(0.01),
              // "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.1395880969.1709942400&semt=sph"
            ),
          ),
        )
        // height: ,
      ),
    );
  }
}

// Text(
//   isTapped == true ? "Container was tapped" : "Container was not tapped",
//   textAlign: TextAlign.center,
//   style: const TextStyle(
//     backgroundColor: Colors.transparent, // Colors.white,
//   ),
// ),