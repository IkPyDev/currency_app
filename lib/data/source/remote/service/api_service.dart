import 'package:untitled3/data/source/remote/response/currency_responce.dart';

abstract class ApiService {

  Future<List<CurrencyModel>> getAllCurrency () ;
  Future<List<CurrencyModel>> getDateCurrency (String date) ;
}