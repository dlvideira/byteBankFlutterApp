import 'package:bytebank/screens/contatos/lista.dart';
import 'package:flutter/material.dart';

const _appBarTitle = "Dashboard";
const _logoPath = "lib/resources/bytebank_logo.png";

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(_logoPath),
          ),
          Padding(
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
          )
        ],
      ),
    );
  }
}
