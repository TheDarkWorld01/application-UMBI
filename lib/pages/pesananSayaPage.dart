import 'package:flutter/material.dart';
import 'package:umbiapps/pages/Homepage.dart';
import 'package:umbiapps/widgets/paybar2.dart';
import 'package:http/http.dart' as http;

class pesananSayaPage extends StatefulWidget {
  @override
  _pesananSayaPageState createState() => _pesananSayaPageState();
}

class _pesananSayaPageState extends State<pesananSayaPage> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Tunggu 3 detik sebelum mengaktifkan tombol
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isButtonEnabled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              payBarii(),
              Container(
                height: 350,
                padding: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                    child: Text(
                      "Detail Product",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _detailProduct(),
                ],
              ),
              // ... Tambahan konten lainnya di sini
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              color: Colors.white, // Warna latar belakang tombol
              child: ElevatedButton(
                onPressed: isButtonEnabled ? () => _showModal('buka') : null,
                style: ElevatedButton.styleFrom(
                  // Mengatur ukuran tombol
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bentuk tumpul
                  ),
                  backgroundColor: Color(0xFF4C53A5).withOpacity(0.53),
                  
                ),
                child: Text(
                  "Buka Pintu Phobos",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailProduct (){
  return Container (
    height: 110,
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Warna bayangan
          spreadRadius: 1, // Radius penyebaran bayangan
          blurRadius: 2, // Radius blur bayangan
          offset: Offset(0, 1), // Posisi bayangan (x, y)
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: EdgeInsets.only(right: 15),
          child: Image.asset("asset/images/1.png"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fried Chicken",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              Text(
                "\Rp.00",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "1x",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
void _showModal(param) async {
  // Tampilkan modal dialog di sini

  final url = 'http://192.168.43.2:80/parameter?param='+param;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Permintaan berhasil');
      // Lakukan sesuatu di sini jika permintaan berhasil
    } else {
      print('Gagal melakukan permintaan: ${response.statusCode}');
      // Lakukan sesuatu di sini jika permintaan gagal
    }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Pesan Makanan"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Silakan ambil makanan Anda."),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup modal
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(), // Ganti dengan halaman yang Anda inginkan
                  ),
                );
                
                // _showModal('tutup');
              },
              child: Text("Kembali ke Halaman Utama"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Tutup"),
          ),
        ],
      );
    },
  );
}

}