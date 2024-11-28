import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:trab_dispositivos_moveis/model/demanda_model.dart';
import 'package:trab_dispositivos_moveis/presenter/save_and_open_pdf.dart';
import 'package:intl/intl.dart';

class SimplePdfApi {
  static Future<File> generateSimpleTextPdf(List<Demanda> demandas) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
              Text('Demandas a serem atendidas',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(height: 50),
              ListView.builder(
                  itemBuilder: (context, index) {
                    var data = DateFormat('d/M/yyyy')
                        .format(demandas[index].data.toDate());
                    return Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                            children: [
                              Text(
                                  '${demandas[index].descricao} - ${demandas[index].endereco}',
                                  style: const TextStyle(fontSize: 24),
                                  textAlign: TextAlign.left),
                              SizedBox(height: 20),
                              Text(
                                  'Ponto de referência: ${demandas[index].pontoDeReferencia}',
                                  style: const TextStyle(fontSize: 20),
                                  textAlign: TextAlign.left),
                              SizedBox(height: 10),
                              Text('Categoria: ${demandas[index].categoria}',
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.left),
                              SizedBox(height: 10),
                              Text('Data: $data',
                                  style: const TextStyle(fontSize: 20),
                                  textAlign: TextAlign.left),
                              Divider(
                                height: 50,
                                thickness: 2,
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min));
                  },
                  itemCount: demandas.length),
            ]));
    return SaveAndOpenDocument.savePdf(name: 'demandas.pdf', pdf: pdf);
  }
}
