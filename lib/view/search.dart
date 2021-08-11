import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  final bool depan;
  final TextEditingController textEditingController;
  Search({this.depan, this.textEditingController});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // var height = MediaQuery.of(context).size.height;

  bool cari = false;

  carii(bool depan, var data) {
    setState(() {
      !cari ? cari = true : cari = false;

      Future.delayed(Duration(seconds: 3), () {
        depan ? Get.toNamed('/tracking?data=$data') : print("bukan depan");

        setState(() {
          if (cari) cari = false;
        });
      });

      print(cari);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      width: cari ? 45 : width,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            cari ? BorderRadius.circular(100) : BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 40,
            offset: Offset(0, 23),
          ),
        ],
      ),
      child: !cari
          ? TextFormField(
              controller: widget.textEditingController,
              onFieldSubmitted: (val) {
                carii(widget.depan, val);
              },
              textInputAction: TextInputAction.search,
              style: TextStyle(
                fontSize: 13,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.inventory,
                  size: 20,
                ),
                contentPadding: EdgeInsets.only(
                  top: 12.5,
                  // bottom: 5,
                  // right: 15,
                  // left: 15,
                ),
                border: InputBorder.none,
                hintText: "Enter track number",
                hintStyle: TextStyle(
                  color: Color(0xff989898),
                  fontSize: 13,
                ),
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
