import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:copy_task12/util/showHexCopiedMessage.dart';
import 'package:copy_task12/widgets/container_widget.dart';

//новый экран с конкретным цветом
class NewScreen extends StatefulWidget {
  final Color appBarColor;
  final String titleNameColor;
  final String codeColor;

  NewScreen({
    required this.appBarColor,
    required this.titleNameColor,
    required this.codeColor,
  });

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final containerHeight = screenHeight / 3;
    final codeRed = widget.appBarColor.red;
    final codeGreen = widget.appBarColor.green;
    final codeBlue = widget.appBarColor.blue;


    return Scaffold(
      appBar: AppBar(
        title: null,
        backgroundColor: widget.appBarColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            color: widget.appBarColor,
            height: containerHeight,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 16.0,
            ),
            alignment: Alignment.centerLeft,
            //color: Colors.lightGreenAccent,
            child: Text(
              widget.titleNameColor,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x37394A14),
                    offset: Offset(0, 12),
                    blurRadius: 12,
                    spreadRadius: 0,
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
              height: 56,
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hex',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'ubuntu',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.codeColor}   ',
                      ),
                      IconButton(
                        icon: const Icon(Icons.content_copy),
                        onPressed: () {
                          FlutterClipboard.copy(widget.codeColor).then((value) {
                            showHexCopiedMessage(context);
                          });
                        },),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              coloredContainer(
                context,
                'Red',
                '$codeRed',
                const EdgeInsets.only(left: 16, right: 16, top: 16),
              ),
              coloredContainer(
                context,
                'Green',
                '$codeGreen',
                const EdgeInsets.only(right: 16, top: 16),
              ),
              coloredContainer(
                context,
                'Blue',
                '$codeBlue',
                const EdgeInsets.only(right: 16, top: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}