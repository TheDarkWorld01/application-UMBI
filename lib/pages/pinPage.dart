import 'package:flutter/material.dart';

class pinPage extends StatefulWidget {
  @override
  _pinPageState createState() => _pinPageState();
}

class _pinPageState extends State<pinPage> {
  String enteredPin = '';

  void _handlePinButtonPress(String digit) {
    if (enteredPin.length < 4) {
      setState(() {
        enteredPin += digit;
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
        backgroundColor: Colors.transparent, // Warna latar belakang app bar
      ),
      backgroundColor: Color(0xFF4C53A5), // Warna latar belakang halaman
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0), // Tambahkan margin bawah sebesar 30px
              child: Text(
                'Masukan Kode Keamanan:',
                style: TextStyle(fontSize: 24, color: Colors.white), // Warna teks
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 200,
              alignment: Alignment.center,
              child: Text(
                enteredPin,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Warna teks
              ),
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
                SizedBox(width: 95),
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
    );
  }

  Widget _buildPinButton(String digit) {
    return ElevatedButton(
      onPressed: () => _handlePinButtonPress(digit),
      child: Text(digit),
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Warna latar belakang tombol
        onPrimary: Color(0xFF4C53A5), // Warna teks pada tombol
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: _handleClearButtonPress,
      child: Icon(
        Icons.clear_sharp,
        color: Color(0xFF4C53A5),
        size: 16
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Warna latar belakang tombol
        onPrimary: Color(0xFF4C53A5), // Warna teks pada tombol
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
