



// // import 'package:flutter/material.dart';
// //
// // void myBottomSheetDialog(BuildContext context, String rate, String ccy, String sum) {
// //   var inputController = TextEditingController(text: '1');
// //   var outputController = TextEditingController(text: rate);
// //   bool isClick = false;
// //   var displayCurrency = ccy;
// //   var convertedCurrency = "UZB";
// //
// //   void updateConversion(String value) {
// //     double inputValue = double.tryParse(value) ?? 0.0;
// //     double conversionRate = double.tryParse(rate) ?? 0.0;
// //
// //     if (isClick) {
// //       double convertedValue = conversionRate != 0 ? inputValue / conversionRate : 0.0;
// //       outputController.text = convertedValue.toString();
// //     } else {
// //       double convertedValue = inputValue * conversionRate;
// //       outputController.text = convertedValue.toString();
// //     }
// //   }
// //
// //   void swapCurrencies() {
// //     isClick = !isClick;
// //     displayCurrency = isClick ? "UZB" : ccy;
// //     convertedCurrency = isClick ? ccy : "UZB";
// //   }
// //
// //   showModalBottomSheet(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return Padding(
// //         padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
// //         child: SingleChildScrollView(
// //           child: Container(
// //             height: 260.0,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(24.0),
// //               color: Colors.white,
// //             ),
// //             child: Column(
// //               children: [
// //                 SizedBox(height: 8.0),
// //                 Container(
// //                   width: 56,
// //                   height: 10,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(16.0),
// //                     color: Colors.black12,
// //                   ),
// //                 ),
// //                 SizedBox(height: 24.0),
// //                 Center(
// //                   child: Text(
// //                     'davlat',
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 18.0,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: EdgeInsets.symmetric(horizontal: 16),
// //                   child: Column(
// //                     children: [
// //                       SizedBox(height: 4),
// //                       TextField(
// //                         controller: inputController,
// //                         onChanged: updateConversion,
// //                         decoration: InputDecoration(
// //                           labelText: displayCurrency,
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                           ),
// //                           contentPadding: EdgeInsets.all(16.0),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderSide: BorderSide(color: Colors.blue, width: 2),
// //                           ),
// //                           floatingLabelBehavior: FloatingLabelBehavior.always,
// //                         ),
// //                       ),
// //                       SizedBox(height: 16),
// //                       TextField(
// //                         controller: outputController,
// //                         decoration: InputDecoration(
// //                           labelText: convertedCurrency,
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                           ),
// //                           contentPadding: EdgeInsets.all(16.0),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderSide: BorderSide(color: Colors.blue, width: 2),
// //                           ),
// //                           floatingLabelBehavior: FloatingLabelBehavior.always,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: 8),
// //                 InkWell(
// //                   onTap: () {
// //                     var temp = inputController.text;
// //                     inputController.text = outputController.text;
// //                     outputController.text = temp;
// //                     swapCurrencies();
// //                   },
// //                   child: Row(
// //                     children: [
// //                       Spacer(),
// //                       Icon(Icons.swap_vert), // Assuming 'converter' function returns an icon
// //                       SizedBox(width: 24.0),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       );
// //     },
// //   );
// // }
//
//
// import 'package:flutter/material.dart';
//
// void myBottomSheetDialog(BuildContext context, String rate, String ccy,
//     String sum) {
//   var get = TextEditingController();
//   bool isCLick = false;
//   get.text = '1';
//   FocusNode _focusNode = FocusNode();
//   FocusNode _focusNode2 = FocusNode();
//   final add = TextEditingController();
//   var chet = ccy;
//   var bi = "UZB";
//   add.text = rate.toString();
//
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(0.0).copyWith(
//               bottom: MediaQuery.of(context).viewInsets.bottom
//           ),
//           child: SingleChildScrollView(
//             child: Container(
//               height: 260.0,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(24.0), color: Colors.white),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                   Container(
//                     width: 56,
//                     height: 10,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         color: Colors.black12),
//                   ),
//                   const SizedBox(
//                     height: 24.0,
//                   ),
//                   Center(
//                       child: Text(
//                         'davlat',
//                         style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold),
//                       )),
//                   Container(
//                       margin: const EdgeInsets.only(left: 16, right: 16),
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 4,
//                           ),
//                           ValueListenableBuilder<TextEditingValue>(
//                               valueListenable: get,
//                               builder: (context, value, chaild) {
//                                 return TextField(
//                                   controller: get,
//                                   onChanged: (value) {
//                                     if (isCLick == true) {
//                                       double firstValue =
//                                           double.tryParse(value) ?? 0.0;
//                                       double first = double.tryParse(rate) ?? 0.0;
//                                       print(first.toString());
//                                       double secondValue =
//                                       first != 0 ? firstValue / first : 0.0;
//                                       add.text = (secondValue / first).toString();
//
//                                       print((secondValue).toString());
//                                       print((secondValue / first).toString());
//                                       print((ccy).toString());
//                                       print(secondValue.toString());
//
//                                       add.text = secondValue.toString();
//                                     } else if (isCLick == false) {
//                                       double firstValue =
//                                           double.tryParse(value) ?? 0.0;
//                                       double addFirst =
//                                           double.tryParse(rate.toString()) ?? 0.0;
//                                       double secondValue = firstValue * addFirst;
//                                       add.text = secondValue.toString();
//                                     }
//                                   },
//                                   decoration: InputDecoration(
//                                     labelText: chet,
//                                     border: const OutlineInputBorder(
//
//
//                                         borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(8),
//                                     bottomRight: Radius.circular(8),
//                                     topLeft: Radius.circular(8),
//                                     topRight: Radius.circular(8),
//                                   ),
//                                 ),
//                                 contentPadding: const EdgeInsets.all(16.0),
//                                 focusedBorder: const OutlineInputBorder(
//
//                                 borderSide: BorderSide(
//                                 color: Colors.blue, width: 2)),
//                                 floatingLabelBehavior:
//                                 FloatingLabelBehavior.always,
//                                 labelStyle: TextStyle(
//                                 color: _focusNode.hasFocus
//                                 ? Colors.blue
//                                     : Colors.black87,
//                                 )),
//
//                                 );
//                               }),
//                           const SizedBox(height: 16),
//                           TextField(
//                             controller: add,
//                             onChanged: (value) {},
//                             decoration: InputDecoration(
//                                 labelText: bi,
//                                 border: const OutlineInputBorder(
//                                   borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(8),
//                                     bottomRight: Radius.circular(8),
//                                     topLeft: Radius.circular(8),
//                                     topRight: Radius.circular(8),
//                                   ),
//                                 ),
//                                 contentPadding: const EdgeInsets.all(16.0),
//                                 focusedBorder: const OutlineInputBorder(
//                                     borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(8),
//                                       bottomRight: Radius.circular(8),
//                                       topLeft: Radius.circular(8),
//                                       topRight: Radius.circular(8),
//                                     ),
//                                     borderSide:
//                                     BorderSide(color: Colors.blue, width: 2)),
//                                 floatingLabelBehavior: FloatingLabelBehavior.always
//                             ),
//                           ),
//                         ],
//                       )),
//                   const SizedBox(height: 8),
//                   InkWell(
//                     onTap: () {
//                       var d = get.text;
//                       var n = int.parse(d);
//                       get.text = add.text;
//                       add.text = n.toString();
//                       isCLick = !isCLick;
//                       if (!isCLick) {
//                         chet = ccy;
//                         bi = "UZB";
//                       } else {
//                         chet = "UZB";
//                         bi = ccy;
//                         print("mm" + chet);
//                         print("44" + ccy);
//                       }
//                     },
//                     child: Row(
//                       children: [
//                         Spacer(),
//                         // converter(),
//                         SizedBox(width: 24.0,)
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
// }

