import 'package:bytebank/components/contatoWidget.dart';
import 'package:bytebank/components/transferenciaWidget.dart';
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
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                contatosWidget(context),
                transferenciasWidget(context)
              ],
            ),
          )
        ],
      ),
    );
  }
}
