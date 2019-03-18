import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final List<Widget> widgets;
  final String buttonName;
  final Function() buttonFunc;

  const CardWidget(
      {Key key,
      @required this.widgets,
      @required this.buttonName,
      this.buttonFunc})
      : assert(widgets != null),
        assert(buttonName != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(children: widgets),
          ),
        ),
        Positioned(
          bottom: 25,
          left: 55,
          right: 55,
          child: GestureDetector(
            onTap: buttonFunc,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(2, 2),
                    blurRadius: 7,
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFFC4889),
                    Color(0xFFF7AF5A),
                  ],
                  stops: [0.3, 1],
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                buttonName,
                style: Theme.of(context).textTheme.display4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
