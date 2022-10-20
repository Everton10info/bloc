# :snake: Show Snackbar

Como usar BlocListener para mostrar uma SnackBar em resposta a uma mudança de estado em um bloco.

![aplicação](assets/flutter_snack_bar.gif)

## :pushpin: Bloc 
Construindo um bloc básico [DataBloc](lib/bloc/data_bloc.dart) ,que manipula eventos  [DataEvent](lib/bloc/data_event.dart) e produz estados [DataStates](lib/bloc/data_state.dart).

## :pushpin: DataEvent
Nosso [DataBloc](lib/bloc/data_bloc.dart) responderá apenas a um único [DataEvent](lib/bloc/data_event.dart) chamado **FetchData**.


## :pushpin: DataState

Nosso [DataBloc](lib/bloc/data_bloc.dart) pode ter um dos três diferentes [DataStates](lib/bloc/data_state.dart):

* **Initial** - O estado inicial antes de quaisquer eventos serem adicionados.

* **Loading** - O estado do bloco enquanto ele está "buscando dados" de forma 
assíncrona.

* **Success** - O estado do bloco quando ele "buscou dados" com sucesso.

## :pushpin: DataBloc
Nosso **DataBloc** deve ficar mais ou menos assim:

``` dart import 'package:bloc/bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Initial()) {
    on<FetchData>((event, emit) async {
      emit(Loading());
      await Future.delayed(Duration(seconds: 2));
      emit(Success());
    });
  } 
  ```
  **:pencil:Observação**: estamos usando Future.delayed para simular a latência.

  ## :pushpin: Camada de IU

  Conectar nosso **DataBloc** a um [Widget](lib/main.dart) e mostrar um SnackBar em resposta a um estado de sucesso.

  :warning: Usamos o widget **BlocListener** para FAZER COISAS em resposta a mudanças de estado em nosso arquivo DataBloc.

  :warning: Usamos o widget **BlocBuilder** para fazer a renderização do WIDGET em resposta a mudanças de estado em nosso arquivo DataBloc.

  >:x:  **NUNCA** devemos "fazer coisas" em resposta a mudanças de estado no buildermétodo de BlocBuilderporque esse método pode ser chamado muitas vezes pelo framework Flutter. 
  >O método builder deve ser uma função pura que apenas retorna um widget em resposta ao estado do bloco.

  [Documnetação oficial](https://bloclibrary.dev/#/recipesfluttershowsnackbar)