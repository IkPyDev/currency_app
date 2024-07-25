import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/presantation/currency_bloc.dart';
import 'package:untitled3/ui/currency_screen/Bottom_currency.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final _bloc = CurrencyBloc();
  DateTime selectedDate = DateTime.now();

  int _groupValue = 0;

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    print("INIT yaratildi ");
    _bloc.add(GetAllCurrencyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          title: const Align(
              alignment: Alignment.centerLeft, child: Text("Valyuta")),
          actions: [
            IconButton(
                onPressed: () async {
                  await _selectDate(context);
                  String sendDate = selectedDate.toString().substring(0, 10);
                  _bloc.add(GetDateCurrencyEvent(sendDate));
                },
                icon: const Icon(Icons.date_range_sharp)),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext c) {
                        return buildStatefulBuilder();
                      });
                },
                icon: const Icon(Icons.language))
          ],
        ),
        body: BlocConsumer<CurrencyBloc, CurrencyState>(
          listener: (context, listener) {
            if (listener.status == StatusCurrency.fail) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(listener.errorMessage.toString())));
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case StatusCurrency.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case StatusCurrency.success:
                return SizedBox(
                  height: double.infinity,
                  child: ListView.separated(
                      itemBuilder: (c, i) {
                        if (state.data != null) {
                          final currency = state.data![i];
                          double? isColors =
                              double.tryParse(currency.diff!) ?? 0;
                          Color color = Colors.red;
                          if (isColors > 0) {
                            color = Colors.greenAccent;
                          }

                          String? changeText;
                          String? cal;
                          switch (_groupValue) {
                            case 0:
                              changeText = currency.ccyNmUZ;
                              cal = "Hisoblash";
                            case 1:
                              changeText = currency.ccyNmUZC;
                              cal = "Ҳисоблаш";
                            case 2:
                              changeText = currency.ccyNmRU;
                              cal = "Расчет";
                            case 3:
                              changeText = currency.ccyNmEN;
                              cal = "Calculation";
                          }

                          return item(
                              c,
                              changeText!,
                              currency.diff!,
                              currency.nominal!,
                              currency.ccy!,
                              currency.rate!,
                              currency.date!,
                              color,
                              cal!);
                        } else {
                          return const Text("NULL");
                        }
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: state.data?.length ?? 0),
                );
              // TODO: Handle this case.
              case StatusCurrency.fail:
                return const Center(
                  child: Text("Error Fail"),
                );
              case null:
                return Text("Null");
            }
          },
        ),
      ),
    );
  }

  StatefulBuilder buildStatefulBuilder() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter myState) {
      return SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _myRadioButton("O'zbekcha", 0, (a) {
              myState(() => setState(() {
                    _groupValue = a!;
                  }));
            }),
            _myRadioButton("Ўзбекча", 1, (a) {
              myState(() => setState(() {
                    _groupValue = a!;
                  }));
            }),
            _myRadioButton("Русский", 2, (a) {
              myState(() => setState(() {
                    _groupValue = a!;
                  }));
            }),
            _myRadioButton("Englis", 3, (a) {
              myState(() => setState(() {
                    _groupValue = a!;
                  }));
            }),
          ],
        ),
      );
    });
  }

  Widget _myRadioButton(
      String title, int value, void Function(int? y) onChanged) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: (a) {
        onChanged(a);
      },
      title: Text(title),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2023, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }
}

Widget item(BuildContext context, String ccuName, String diff, String nominal,
    String ccy, String rate, String date, Color color, String cal) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    elevation: 8,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: ExpansionTile(
          title: Row(
            children: [
              Text(
                ccuName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(width: 8),
              Text(
                diff,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: color),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text(nominal),
              Text(ccy),
              const SizedBox(width: 2.0),
              const Text('=>'),
              const SizedBox(width: 2.0),
              Text(rate),
              const SizedBox(width: 4.0),
              const Text('UZS|'),
              const SizedBox(width: 2.0),
              SvgPicture.asset(
                'assets/images/calendar.svg',
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 2.0),
              Text(date),
            ],
          ),
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      var a =double.tryParse(rate) ?? 0;
                      showBottomSheet(context: context, builder: (c) {
                        return BottomCurrency(  ccyName: ccuName,conversionFactor:a  );
                      });
                    },
                    child: itemCalculate(cal)),
                const SizedBox(width: 16.0),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    ),
  );
}

Widget itemCalculate(String cal) {
  return Container(
    height: 32,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), color: Colors.deepPurple),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 4.0,
        right: 4.0,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 8.0,
          ),
          SvgPicture.asset(
            'assets/images/calculate.svg',
            width: 20,
            height: 20,
            color: Colors.white,
          ),
          Text(
            cal,
            style: const TextStyle(color: Colors.white),
          ),
          //   SizedBox(width: 16.0,),
        ],
      ),
    ),
  );
}

void myBottomSheetDialog(
    BuildContext context, String ccy, String ccuName, String rate) {
  showBottomSheet(
      context: context,
      builder: (ctx) {
        var uzController = TextEditingController();
        var ccyController = TextEditingController();
        double rat = double.tryParse(rate) ?? 0;
        String f1 = ccy;
        String f2 = "UZS";
        bool isBool = false;

        return Container(

            // padding: MediaQuery.of(ctx).viewInsets,
            padding: const EdgeInsets.all(16)+MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 8,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                    child: Text(
                  ccuName,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                )),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: isBool ? uzController : ccyController,

                  decoration: InputDecoration(
                    labelText: isBool ? f1 : f2,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  readOnly: true,
                  controller: isBool ? ccyController : uzController,
                  decoration: InputDecoration(
                    labelText: isBool ? f2 : f1,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.deepPurpleAccent,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () {
                            isBool = !isBool;
                          },
                          child: SvgPicture.asset(
                            "assets/images/arrow.svg",
                            color: Colors.white,
                          ),
                        )))
              ],
            ));
      });
}
