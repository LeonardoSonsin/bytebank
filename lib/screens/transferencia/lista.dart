import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTranferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTranferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTranferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          final transferencia = widget._transferencias[index];
          return ItemTranferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const FormularioTransferencia();
            })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualiza(transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTranferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTranferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text('R\$ ${_transferencia.valor}'),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
