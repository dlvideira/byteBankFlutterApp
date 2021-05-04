import 'package:bytebank/screens/contatos/lista.dart';
import 'package:flutter/material.dart';

Padding contatosWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Contatos(),
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
                Icons.people,
                color: Colors.white,
                size: 24,
              ),
              Text("Contacts",
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
      ),
    ),
  );
}
