import 'package:bloc/bloc.dart';

import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(const BookState()) {
    on<BookSelected>((event, emit) {
      emit(state.copyWith(selectedBook: () => event.book));
    });
    on<BookDeselected>((event, emit) {
      emit(state.copyWith(selectedBook: () => null));
    });
  }
}
