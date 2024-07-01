part of 'currency_bloc.dart';

abstract class CurrencyEvent {}

class GetAllCurrencyEvent extends CurrencyEvent{}
class GetDateCurrencyEvent extends CurrencyEvent{
  final String date;

  GetDateCurrencyEvent(this.date);
}
class UzbCurrencyEvent extends CurrencyEvent{}
class RusCurrencyEvent extends CurrencyEvent{}
class EngCurrencyEvent extends CurrencyEvent{}
