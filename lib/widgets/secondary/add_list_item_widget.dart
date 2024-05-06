import "package:flutter/material.dart";

class AddItemToListWidget extends StatelessWidget{

  double? paddingTop;
  double? deviceHeight;
  double? deviceWidth;

  Widget build(BuildContext context){

    var mediaQuery = MediaQuery.of(context);
    paddingTop = mediaQuery.padding.top;
    deviceHeight = mediaQuery.size.height;
    deviceWidth = mediaQuery.size.width;

    /// Fancy TextForm Field Element -> to add items to list
    return InkWell(
      onTap: () => {
        // setState(()=>isTapped = !isTapped)
      },
      // focusColor: Colors.blue,
      splashColor: Colors.blueAccent,
      highlightColor: Colors.transparent,
      // overlayColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      borderRadius: BorderRadius.circular(10),
      child: Container(
          alignment: Alignment.centerRight,
          height: .05 * MediaQuery.of(context).size.height,
          width: .85 * MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: 0.0233 * deviceWidth!, // approx 10px- iPhone 14 Pro Max
            vertical: 0.0043 * deviceHeight!, // approx 4px - iPhone 14 Pro Max
          ),
          // margin: EdgeInsets.fromLTRB(0, paddingTop!, 0, 0),
          // color: Colors.tealAccent,
          decoration: BoxDecoration(
            // color: Colors.tealAccent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.blueAccent.withRed(90), // Colors.blueAccent,
                  width: 0.425,
                  style: BorderStyle.solid
              )
          ),
          child: plusIconWidget()

      ),
    );

  }
}

/// Plus Icon Widget
Container plusIconWidget() {

  Container plusIcon = Container(
    // alignment: Alignment.center,
    // width: ,
    decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(6)
    ),
    child: const Icon(
      Icons.add,
      semanticLabel: "addButton",
      size: 20,
      color: Colors.white,
    ),
  );

  print("plusIcon width: ${plusIcon.toString()} ");

  return plusIcon;
}