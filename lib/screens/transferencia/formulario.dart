import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/transferenciaDao.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _snackBarText = "Verifique os valores e tente novamente.";
const _appBarText = "Criar Transferência";
const _rotuloValor = "Valor";
const _dicaValor = "0.00";
const _rotuloConta = "Numero da conta";
const _dicaConta = "0000";
const _confirmButtonText = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();
  final TransferenciaDao _dao = TransferenciaDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarText),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorConta,
              rotulo: _rotuloConta,
              dica: _dicaConta,
            ),
            Editor(
              controlador: _controladorValor,
              rotulo: _rotuloValor,
              dica: _dicaValor,
              icondata: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_confirmButtonText),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final double _valor = double.tryParse(_controladorValor.text);
    final int _conta = int.tryParse(_controladorConta.text);

    if (_conta != null && _valor != null) {
      final _transferenciaCriada = Transferencia(0, _conta, _valor);
      _dao.save(_transferenciaCriada).then((value) => Navigator.pop(context));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_snackBarText),
        ),
      );
    }
  }
}
