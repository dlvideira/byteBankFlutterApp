class Transferencia {
  final int id;
  final int conta;
  final double valor;

  Transferencia(this.id, this.conta, this.valor);

  @override
  String toString() {
    return 'Transferencia{id: $id, conta: $conta, valor: $valor}';
  }
}
