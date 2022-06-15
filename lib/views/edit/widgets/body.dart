import 'package:crud2/util/components/devtvas_button.dart';
import 'package:crud2/util/custom_color.dart';
import 'package:crud2/util/media_query.dart';
import 'package:crud2/util/services/product_service.dart';
import 'package:crud2/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:mask/mask/mask.dart';

//edit
class Body extends StatefulWidget {
  final DocumentSnapshot? item;
  const Body({
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKeyEdit = GlobalKey<FormState>();
  TextEditingController? titleCTRL;
  TextEditingController? typeCRTL;
  TextEditingController? priceCRTL;
  final String campoVazio = 'Preenchimento obrigatório!';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleCTRL = TextEditingController();
    typeCRTL = TextEditingController();
    priceCRTL = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleCTRL!.dispose();
    typeCRTL!.dispose();
    priceCRTL!.dispose();
  }

  Future<void> clearInputText() async {
    titleCTRL!.clear();
    typeCRTL!.clear();
    priceCRTL!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MQuery.width! * 0.5,
                height: MQuery.height! * 0.05,
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    TextFormField(
                      validator: (value) => validator(value),
                      controller: titleCTRL,
                      minLines: 1,
                      // maxLines: 25,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColor.tEditProd.withOpacity(0.2),
                        hintText: '${widget.item!['title']} *',
                        hintStyle: TextStyle(
                          color: CustomColor.tTitleWhite,
                        ),
                        // labelText: "Descrição Mensagem"
                      ),
                    )
                  ],
                ),
              ),

              //update
              Container(
                width: MQuery.width! * 0.35,
                height: MQuery.height! * 0.05,
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    TextFormField(
                      validator: (value) => validator(value),
                      controller: typeCRTL,
                      minLines: 1,
                      // maxLines: 25,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColor.tEditProd.withOpacity(0.2),
                        hintText: '${widget.item!['type']} *',
                        hintStyle: TextStyle(
                          color: CustomColor.tTitleWhite,
                        ),
                        // labelText: "Descrição Mensagem"
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.item!['description'],
            style: TextStyle(
              color: CustomColor.kSubtitleColor,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBarIndicator(
                rating:
                    Validators.convertIntRatingDouble(widget.item!['rating']),
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.indigo,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
              Container(
                width: MQuery.width! * 0.35,
                height: MQuery.height! * 0.05,
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    Form(
                      key: _formKeyEdit,
                      child: TextFormField(
                        validator: (value) => validator(value),
                        controller: priceCRTL,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: [Mask.money()],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: CustomColor.tEditProd.withOpacity(0.2),
                          hintText:
                              '${Validators.formatCasaDecimal(widget.item!['price'])} *',
                          hintStyle: TextStyle(
                            color: CustomColor.tTitleWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Divider(color: CustomColor.kBorderColor),
          const SizedBox(height: 30),
          DevtvasButton(
            title: 'Atualizar',
            onTap: () => _onUpdateProd(),
          ),
        ],
      ),
    );
  }

  dynamic validator(value) {
    if (value.isEmpty) {
      return campoVazio;
    }
    return null;
  }

  _formatPrice() {
    dynamic str = priceCRTL!.text;

    dynamic parts = str.split(' '); //transformar string x array...

    dynamic sufix = parts[1].trim(); //pegar ultimo indice...

    dynamic ponto = sufix.replaceAll(',', '.'); //trocar virg x ponto...

    dynamic result = double.parse(ponto); //converter string x double...
    //
    return result;
  }

  _onUpdateProd() async {
    //erro validacao
    if (!_formKeyEdit.currentState!.validate()) {
      return null;
    } else if (titleCTRL!.text.isNotEmpty &&
        typeCRTL!.text.isNotEmpty &&
        priceCRTL!.text.isNotEmpty) {
      _formKeyEdit.currentState!.save();
      dynamic id = widget.item!.id;
      dynamic title = titleCTRL!.text;
      dynamic type = typeCRTL!.text;
      double price = _formatPrice();
      //
      await ProductService().updateProduct(id, title, type, price);
      Navigator.pop(context);
    }
    return clearInputText();
  }
}
