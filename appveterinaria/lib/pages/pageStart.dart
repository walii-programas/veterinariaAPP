import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.purple[400]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "VETERINARIA SAN CARLOS",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "APP DESARROLLADO DE ACUERDO A TUS NECESIDADES LA CUAL NOS AYUDA A TENER MEJOR CONTROL DE NUESTRAS MASCOTAS ",
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
