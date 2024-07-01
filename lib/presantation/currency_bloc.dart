import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled3/data/repository/currency_repository.dart';
import 'package:untitled3/data/repository/currency_repository_impl.dart';

import '../data/source/remote/response/currency_responce.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {



  CurrencyBloc() : super(CurrencyState()) {
    final CurrencyRepository repository = CurrencyRepositoryImpl();
    on<GetAllCurrencyEvent>((event, emit) async {
      try {
        print(" Bloc Loading ");
        emit(CurrencyState(status: StatusCurrency.loading));
        final result = await repository.getAllCurrency();
        print(" Bloc Success ");

        emit(CurrencyState(status: StatusCurrency.success,data: result));

      }catch(e){
        emit(CurrencyState(status: StatusCurrency.fail,errorMessage: e.toString()));
        print(" Bloc Error ");

      }


    }
    );
    on<GetDateCurrencyEvent>((event, emit) async {
      try {
        print(" Bloc Loading ");
        emit(CurrencyState(status: StatusCurrency.loading));
        final result = await repository.getDateCurrency(event.date);
        print(" Bloc Success ");

        emit(CurrencyState(status: StatusCurrency.success,data: result));

      }catch(e){
        emit(CurrencyState(status: StatusCurrency.fail,errorMessage: e.toString()));
        print(" Bloc Error ");

      }

    });
  }
}
