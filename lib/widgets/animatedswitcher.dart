import 'package:flutter/material.dart';

class AnimatedSwitcherDeivao extends StatefulWidget {
  final PageController controller;

  const AnimatedSwitcherDeivao({Key key, this.controller}) : super(key: key);
  @override
  _AnimatedSwitcherDeivaoState createState() => _AnimatedSwitcherDeivaoState();
}

class _AnimatedSwitcherDeivaoState extends State<AnimatedSwitcherDeivao> {
  double _width = 0;

  void getWidth() {
    var width = (context.findRenderObject() as RenderBox)?.size?.width;
    if (_width == 0 && width == null)
      Future.delayed(Duration(milliseconds: 500), getWidth);
    else if(width != null)
      setState(() {
        _width = width;
      });
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWidth();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.controller.page == 0)
          widget.controller.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        else
          widget.controller.previousPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
      },
      onHorizontalDragUpdate: (val) {
        widget.controller.jumpTo(
          (widget.controller.page *
                  widget.controller.position.maxScrollExtent) +
              val.primaryDelta * 2,
        );
      },
      onHorizontalDragEnd: (val) {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(25),
        ),
        child: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, snapshot) {
            if (_width == 0 || widget.controller.positions.isEmpty)
              return Container();

            var page = widget.controller?.page ?? 0;
            return Stack(
              children: <Widget>[
                Transform.translate(
                  child: _buildButton(context),
                  offset:
                      Offset(widget.controller.page * ((_width / 2) - 5), 0),
                ),
                Container(
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Existing",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.lerp(Colors.black, Colors.white, page),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "New",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.lerp(Colors.white, Colors.black, page),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      width: _width / 2,
    );
  }
}
