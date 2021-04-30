import 'package:bytebank/database/contatoDao.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

const _appBarTitle = "Novo contato";
const _textFonSize = 24.0;

class FormularioContato extends StatefulWidget {
  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nome completo"),
              style: TextStyle(
                fontSize: _textFonSize,
              ),
            ),
            TextField(
              controller: _accountController,
              decoration: InputDecoration(labelText: "Número da conta"),
              style: TextStyle(
                fontSize: _textFonSize,
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    final Contato novoContato = Contato(0, _nameController.text,
                        int.tryParse(_accountController.text));
                    _dao.save(novoContato).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
