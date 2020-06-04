import 'package:ByteBank/components/input.dart';
import 'package:ByteBank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppbar = 'Nova transferencia';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppbar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InputNumber(
                controller: _controllerConta,
                label: 'Numero da conta com digito',
                hint: '00000-0',
                icon: Icon(Icons.credit_card),
              ),
              InputNumber(
                controller: _controllerValor,
                label: 'Valor para transferencia',
                hint: 'R\$ 00,00',
                icon: Icon(Icons.monetization_on),
              ),
              RaisedButton(
                child: Text('Transferir'),
                onPressed: () => _executarTransferencia(context),
              ),
            ],
          ),
        ));
  }

  void _executarTransferencia(BuildContext context) {
    final int conta = int.tryParse(_controllerConta.text);
    final double valor = double.tryParse(_controllerValor.text);
    if (conta != null && valor != null) {
      final transferencia = Transferencia(valor, conta);
      Navigator.pop(context, transferencia);
    }
  }
}