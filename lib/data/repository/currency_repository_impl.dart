
import 'package:untitled3/data/repository/currency_repository.dart';
import 'package:untitled3/data/source/remote/response/currency_responce.dart';
import 'package:untitled3/data/source/remote/service/api_service.dart';
import 'package:untitled3/data/source/remote/service/api_service_impl.dart';

 class CurrencyRepositoryImpl extends CurrencyRepository {
   final ApiService api = ApiServiceImpl();
  @override
  Future<List<CurrencyModel>> getAllCurrency() async {
    try {
      final result = await api.getAllCurrency();
      return result;
    } catch (e){
      print(e);
    }
    throw UnimplementedError();
  }  
  @override
  Future<List<CurrencyModel>> getDateCurrency(String date) async {
    try {
      final result = await api.getDateCurrency(date);
      return result;
    } catch (e){
      print(e);
    }
    throw UnimplementedError();
  }


}