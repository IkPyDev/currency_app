import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomCurrency extends StatefulWidget {
   BottomCurrency({super.key,required this.ccyName, required this.conversionFactor});

   final String ccyName;
   final double conversionFactor;

  @override
  State<BottomCurrency> createState() => _BottomCurrencyState();
}

class _BottomCurrencyState extends State<BottomCurrency> {

  @override
  void initState() {
    uzsController.addListener(_uzsConvertListener);
    ccyController.addListener(_ccyConvertListener);
    super.initState();
  }

  final TextEditingController uzsController = TextEditingController();
  final TextEditingController ccyController = TextEditingController();
  bool isUzsToCcy = false;
  @override
  Widget build(BuildContext context) {
    return  Container(

      padding:  const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            height: 8,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey),
          ),
          const SizedBox(height: 12),
          TextField(
            keyboardType: TextInputType.number,
            controller: isUzsToCcy ? uzsController : ccyController,
            decoration: InputDecoration(
              labelText: isUzsToCcy ? 'UZS' : widget.ccyName,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            readOnly: true,
            controller: isUzsToCcy ? ccyController : uzsController,
            decoration: InputDecoration(
              labelText: isUzsToCcy ? widget.ccyName : 'UZS',
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  isUzsToCcy = !isUzsToCcy;
                  setState(() {});
                  print('change calculator $isUzsToCcy');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/arrow.svg',
                    height: 24,
                    width: 24,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  void _uzsConvertListener() {
    if (uzsController.text.isNotEmpty) {
      double uzs = double.tryParse(uzsController.text) ?? 1;
      double ccy = uzs / widget.conversionFactor;

      ccyController.removeListener(_ccyConvertListener);
      ccyController.text = ccy.toStringAsFixed(2);
      ccyController.addListener(_ccyConvertListener);
    } else {
      ccyController.removeListener(_ccyConvertListener);
      ccyController.clear();
      ccyController.addListener(_ccyConvertListener);
    }
  }

  void _ccyConvertListener() {
    if (ccyController.text.isNotEmpty) {
      double ccy = double.tryParse(ccyController.text) ?? 1;
      double uzs = ccy * widget.conversionFactor;

      uzsController.removeListener(_uzsConvertListener);
      uzsController.text = uzs.toStringAsFixed(2);
      uzsController.addListener(_uzsConvertListener);
    } else {
      uzsController.removeListener(_uzsConvertListener);
      uzsController.clear();
      uzsController.addListener(_uzsConvertListener);
    }
  }
}





