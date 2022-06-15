import 'package:crud2/app/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TemplateDialog extends State<StatefulWidget>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //https://www.codegrepper.com/code-examples/dart/flutter+return+empty+widget
    return SizedBox.shrink();
  }

  static showDialogSnack(BuildContext context, String title) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  showDialogRemoveItem(BuildContext context, String id) {
    AlertDialog dialogue = AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Text(
              "Excluir item",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      content: Expanded(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.warning_rounded,
                  color: Color.fromRGBO(173, 42, 42, 1),
                  size: 60,
                ),
              ),
              Observer(builder: (_) {
                return const Text(
                  "Tem certeza que deseja deletar este item?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                );
              }),
              Expanded(child: Container()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            //
                            await ProductService().removeProduct(id);
                            //
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Excluído com sucesso'),
                              duration: const Duration(seconds: 1),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {},
                              ),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.fromLTRB(35, 10, 35, 10),
                              primary: const Color.fromRGBO(173, 42, 42, 1)),
                          child: const Text("Sim",
                              style: TextStyle(fontSize: 18.0)))),
                  Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                          },
                          child: const Text(
                            "Não",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialogue;
      },
    );
  }
}
