import 'package:flutter/material.dart';
import 'package:umbiapps/pages/pesananSayaPage.dart';
class SuccessPage extends StatefulWidget{
  @override
  _SuccessPageState createState() => _SuccessPageState(); 
}

class _SuccessPageState extends State<SuccessPage>{
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      setState((){
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran Berhasil'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _isLoading ? 0:100,
              height: _isLoading ? 0:100,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child : _isLoading ? Container(): Icon(
                Icons.check,
                color:Colors.white,
                size: 60,
              )
            ),
            SizedBox(height: 16,),
            _isLoading ? CircularProgressIndicator():Text(
              'Pembayaran Anda Berhasil',
              style: TextStyle(
                fontSize: 24,
                color:Colors.green,
              ),
            ),
            SizedBox(height: 24),
            _isLoading ? Container(): ElevatedButton(
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => pesananSayaPage()));
            },
            child: Text('Pesanan Saya'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
            ),
            )
          ],
        ),
      ),
    );
  }
}