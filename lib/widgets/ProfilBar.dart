import 'package:flutter/material.dart';

class ProfilBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          // Icon(
          //   Icons.sort,
          //   size: 30,
          //   color: Color(0xFF4C53A5),
          // ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "UMBIoT",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          Spacer(),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, "setsPage");
              },
              child: Icon(
                Icons.settings,
                size: 32,
                color: Color(0xFF4C53A5),
              ),
            ),
        ],
      ),
    );
  }
}
