import 'package:ByteBank/components/card_transferencia.dart';
import 'package:ByteBank/models/transferencia.dart';
import 'package:ByteBank/screens/formulario_transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppbar = 'Transferencias';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppbar),
      ),
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, index) {
            final transferencia = widget._transferencias[index];
            return CardTransferencia(transferencia);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) {
            _atualiza(transferenciaRecebida);
          });
        },
        child: Icon(Icons.monetization_on),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    setState(() {
      if (transferenciaRecebida != null) {
        widget._transferencias.add(transferenciaRecebida);
      }
    });
  }
}