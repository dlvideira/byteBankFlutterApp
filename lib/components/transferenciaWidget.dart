import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

Padding transferenciasWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ListaTransferencias(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(8),
          height: 100,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.monetization_on,
                color: Colors.white,
                size: 24,
              ),
              Text("Transferências",
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
      ),
    ),
  );
}
