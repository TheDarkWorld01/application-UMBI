import 'package:flutter/material.dart';
import 'package:umbiapps/widgets/itempay.dart';
import 'package:umbiapps/widgets/paybar.dart';
import 'package:umbiapps/widgets/paybutton.dart';
class pilihanLokasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          payBar(),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                ItemPay(),
                Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // child: Icon(
                        //   Icons.add,
                        //   color: Colors.white,
                        // ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 10),
                      //   child: Text(
                      //     "Tambahkan kode kupon",
                      //     style: TextStyle(
                      //       color: Color(0xFF4C53A5),
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 16
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: payButton(),
    );
  }
}