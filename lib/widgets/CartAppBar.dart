import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  final Function onLocationFilled;
  final ValueNotifier<String> locationNotifier;

  CartAppBar({required this.onLocationFilled, required this.locationNotifier});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 113,
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context); // Menutup modal bottom sheet
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color(0xFF4C53A5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Keranjang Belanja",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.more_vert,
                size: 30,
                color: Color(0xFF4C53A5),
              ),
              SizedBox(width: 20), // Add some space between the existing widgets and the location button.
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 42),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 16,),
                              Text(
                                "Pilih Lokasi Anda",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height: 50,
                                      width: 300,
                                      child: TextFormField(
                                        onChanged: (value) {
                                          locationNotifier.value = value;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Masukan Lokasi Anda",
                                          icon: Icon(
                                            Icons.location_searching,
                                            color: Color(0xFF4C53A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 30,
                        color: Color(0xFF4C53A5),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: locationNotifier,
                        builder: (context, location, child) {
                          return Text(
                            location,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF4C53A5),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
