part of 'currency_bloc.dart';

class CurrencyState {
  final String? errorMessage;

  final List<CurrencyModel>? data;
  final StatusCurrency? status;

  CurrencyState({this.errorMessage, this.data, this.status});

  CurrencyState copyWith(
          {StatusCurrency? status, List<CurrencyModel>? data, String? errorMessage}) =>
      CurrencyState(
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage,
          data: data ?? this.data);
}

enum StatusCurrency { loading, success, fail }
