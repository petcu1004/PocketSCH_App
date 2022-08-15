import 'package:flutter/material.dart';

class SolidButtonBuilder extends StatefulWidget {
  final String? text;
  final Color? color;
  final Color? shadowcolor;
  final double? hegiht;
  final double? shadowheight;
  final double? width;
  final TextStyle? textstyle;
  final double? position;

  SolidButtonBuilder(
      {Key? key,
      this.text,
      this.color,
      this.shadowcolor,
      this.hegiht,
      this.shadowheight,
      this.width,
      this.textstyle,
      this.position})
      : super(key: key);

  @override
  State<SolidButtonBuilder> createState() => _SolidButtonBuilderState(text,
      color, shadowcolor, hegiht, shadowheight, width, textstyle, position);
}

class _SolidButtonBuilderState extends State<SolidButtonBuilder> {
  double _initPosition = 4;
  double _position = 4;
  String _text = '';
  Color _color = Colors.blue;
  Color _shadowColor = Colors.black;
  double _height = 64;
  double _shadowHeight = 4;
  double _width = 200;
  TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 22,
  );

  _SolidButtonBuilderState(
      String? text,
      Color? color,
      Color? shadowcolor,
      double? height,
      double? shadowheight,
      double? width,
      TextStyle? textstyle,
      double? position) {
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    double _height = this._height - _shadowHeight;
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          _initPosition = _position;
        });
      },
      onTapDown: (_) {
        setState(() {
          _initPosition = 0;
        });
      },
      onTapCancel: () {
        setState(() {
          _initPosition = _position;
        });
      },
      child: Container(
        height: _height + _shadowHeight,
        width: _width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                  color: _shadowColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeIn,
              bottom: _initPosition,
              duration: Duration(milliseconds: 70),
              child: Container(
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    _text,
                    style: _textStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}