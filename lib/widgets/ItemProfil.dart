import 'package:flutter/material.dart';

class ItemProfil extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();

  ItemProfil() {
    // Inisialisasi nilai awal
    namaController.text = "Syahrul Agung Fathoni";
    emailController.text = "syahrulfathoni516@gmail.com";
    teleponController.text = "+62 85879707126";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("asset/profil/images.jpg"),
        ),
        buildCard("Nama", Icons.person_outline, namaController),
        buildCard("Email", Icons.email_outlined, emailController),
        buildCard("Telepon", Icons.phone_android_outlined, teleponController),
      ],
    );
  }

  Widget buildCard(
      String label, IconData icon, TextEditingController controller) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon),
              iconColor: Color(0xFF4C53A5),
              title: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5)
                ),
              ),
            ),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
