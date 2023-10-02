import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:umbiapps/pages/suksesPage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; // Mengimpor paket yang diperlukan

class pinPage extends StatefulWidget {
  @override
  _pinPageState createState() => _pinPageState();
}

class _pinPageState extends State<pinPage> {
  String enteredPin = '';
  bool showSpinner =
      false; // Variabel untuk mengontrol tampilan modal progress HUD

  void _handlePinButtonPress(String digit) {
    if (enteredPin.length < 4) {
      setState(() {
        enteredPin += digit;
      });
    }

    if (enteredPin.length == 4) {
      // Jika panjang enteredPin mencapai 4 digit, tampilkan modal progress HUD
      setState(() {
        showSpinner = true;
      });

      // Tambahkan logika tambahan atau pengalihan ke halaman selanjutnya di sini

      // Contoh pengalihan ke halaman LocationPage setelah menunggu 2 detik
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessPage()),
        );
        // Setelah selesai, sembunyikan modal progress HUD
        setState(() {
          showSpinner = false;
        });
      });
    }
  }

  void _handleClearButtonPress() {
    if (enteredPin.isNotEmpty) {
      setState(() {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kode Keamanan'),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple,
      body: ModalProgressHUD(
        // Menggunakan ModalProgressHUD untuk menampilkan progress HUD
        inAsyncCall: showSpinner, // Mengontrol tampilan progress HUD
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Masukan Kode Keamanan:',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Text(
                enteredPin,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('1'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('2'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('3'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('4'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('5'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('6'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('7'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('8'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('9'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 95,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPinButton('0'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildClearButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinButton(String digit) {
    return ElevatedButton(
      onPressed: () => _handlePinButtonPress(digit),
      child: Text(digit,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.purple,
        shape: CircleBorder(),
        padding: EdgeInsets.all(25),
      ),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: _handleClearButtonPress,
      child: Icon(
        CupertinoIcons.delete_left,
        color: Colors.purple,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.purple,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
