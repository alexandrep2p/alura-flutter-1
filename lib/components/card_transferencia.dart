import 'package:ByteBank/models/transferencia.dart';
import 'package:flutter/material.dart';

class CardTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  CardTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.credit_card),
        title: Text('R\$ ' + _transferencia.valor.toString()),
        subtitle: Text('Conta ' + _transferencia.conta.toString()),
      ),
    );
  }
}