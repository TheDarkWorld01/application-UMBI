import 'package:flutter/material.dart';
// import 'package:umbiapps/widgets/CategoriesWidget.dart';
import 'package:umbiapps/widgets/HomeAppBar.dart';
import 'package:umbiapps/widgets/ItemsWidget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
        HomeAppBar(),
        Container(
          // height: 500,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cari Barang...",
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search_rounded,
                    size: 27,
                    color: Color(0xFF4C53A5)
                  ),
                ],
              ),
            ),
            // //CategoriContaainer//
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: EdgeInsets.symmetric(
            //     vertical: 20,
            //     horizontal: 10,
            //   ),
            //   child: Text(
            //     "Categori",
            //     style: TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //       color: Color(0xFF4C53A5)
            //     ),
            //   ),
            // ),
            // //
            // CategoriesWidget(),
            //items//
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color:  Color(0xFF4C53A5),
                ),
              ),
            ),
            ItemsWidget(),
          ],
          ),
        ),
      ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            Icons.fastfood_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.location_on_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline_outlined,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}