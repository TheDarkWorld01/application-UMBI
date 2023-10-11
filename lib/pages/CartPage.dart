import 'package:flutter/material.dart';
import 'package:umbiapps/widgets/CartAppBar.dart';
import 'package:umbiapps/widgets/CartItemSamples.dart';
import 'package:umbiapps/widgets/CartBottomNavBar.dart';

class CartPage extends StatefulWidget{
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final locationNotifier = ValueNotifier("Pilih Lokasi anda");
  bool isLocationFilled = false; // Variable untuk melacak apakah lokasi sudah diisi

  // Fungsi ini akan dipanggil ketika lokasi diisi
  void onLocationFilled() {
    setState(() {
      isLocationFilled = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(
            onLocationFilled: onLocationFilled,
            locationNotifier: locationNotifier,  
          ), // Mengirimkan callback
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
                CartItemSamples(),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(isLocationFilled: isLocationFilled), // Mengirimkan status
    );
  }
}