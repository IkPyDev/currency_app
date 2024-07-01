/// id : 69
/// Code : "840"
/// Ccy : "USD"
/// CcyNm_RU : "Доллар США"
/// CcyNm_UZ : "AQSH dollari"
/// CcyNm_UZC : "АҚШ доллари"
/// CcyNm_EN : "US Dollar"
/// Nominal : "1"
/// Rate : "12557.67"
/// Diff : "2.51"
/// Date : "01.07.2024"

class CurrencyModel {
  int? id;
  String? code;
  String? ccy;
  String? ccyNmRU;
  String? ccyNmUZ;
  String? ccyNmUZC;
  String? ccyNmEN;
  String? nominal;
  String? rate;
  String? diff;
  String? date;

  CurrencyModel({
    required this.id,
    required this.code,
    required this.ccy,
    required this.ccyNmRU,
    required this.ccyNmUZ,
    required this.ccyNmUZC,
    required this.ccyNmEN,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      CurrencyModel(
        id: json["id"],
        code: json["Code"],
        ccy: json["Ccy"],
        ccyNmRU: json["CcyNm_RU"],
        ccyNmUZ: json["CcyNm_UZ"],
        ccyNmUZC: json["CcyNm_UZC"],
        ccyNmEN: json["CcyNm_EN"],
        nominal: json["Nominal"],
        rate: json["Rate"],
        diff: json["Diff"],
        date: json["Date"],
      );

  // CurrencyResponse copyWith({
  //   num id,
  //   String code,
  //   String ccy,
  //   String ccyNmRU,
  //   String ccyNmUZ,
  //   String ccyNmUZC,
  //   String ccyNmEN,
  //   String nominal,
  //   String rate,
  //   String diff,
  //   String date,
  // }) =>
  //     CurrencyResponse(
  //       id: id ?? this.id,
  //       code: code ?? this.code,
  //       ccy: ccy ?? this.ccy,
  //       ccyNmRU: ccyNmRU ?? this.ccyNmRU,
  //       ccyNmUZ: ccyNmUZ ?? this.ccyNmUZ,
  //       ccyNmUZC: ccyNmUZC ?? this.ccyNmUZC,
  //       ccyNmEN: ccyNmEN ?? this.ccyNmEN,
  //       nominal: nominal ?? this.nominal,
  //       rate: rate ?? this.rate,
  //       diff: diff ?? this.diff,
  //       date: date ?? this.date,
  //     );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['Code'] = code;
    map['Ccy'] = ccy;
    map['CcyNm_RU'] = ccyNmRU;
    map['CcyNm_UZ'] = ccyNmUZ;
    map['CcyNm_UZC'] = ccyNmUZC;
    map['CcyNm_EN'] = ccyNmEN;
    map['Nominal'] = nominal;
    map['Rate'] = rate;
    map['Diff'] = diff;
    map['Date'] = date;
    return map;
  }
}
