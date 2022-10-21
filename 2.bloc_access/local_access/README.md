## Acesso local
Neste exemplo, usaremos **BlocProvider** para disponibilizar um bloc para uma subárvore local. Nesse contexto, local significa dentro de um contexto em que não há rotas sendo empurradas/populadas.

## :pushpin: Bloc
Por uma questão de simplicidade, vamos usar a Counter como nosso aplicativo de exemplo.

Nossa **CounterBloc** implementação ficará assim:

``` dart 
abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}
```
## :pushpin:IU

Teremos 3 partes em nossa interface do usuário:
[App](/2.bloc_access/local_access/lib/main.dart): o widget do aplicativo raiz.
[CounterPage](/2.bloc_access/local_access/lib/counter_page.dart): o widget de contêiner que gerenciará o [CounterBloc](/2.bloc_access/local_access/lib/bloc/counter_bloc.dart) e expõe e **FloatingActionButtons** o **contador.Increment/Decrement**
CounterText: um widget de texto que é responsável por exibir o arquivo count.

Nosso [App](/2.bloc_access/local_access/lib/main.dart) widget é um **StatelessWidget** que usa a **MaterialApp** e define nosso [CounterPage](/2.bloc_access/local_access/lib/counter_page.dart) como o widget inicial. O [App](/2.bloc_access/local_access/lib/main.dart) widget é responsável por criar e fechar o arquivo [CounterBloc](/2.bloc_access/local_access/lib/bloc/counter_bloc.dart), bem como disponibilizá-lo para o [CounterPage](/2.bloc_access/local_access/lib/counter_page.dart) uso de um arquivo **BlocProvider**.


:arrow_right: **Nota**: Quando agrupamos um widget com **BlocProvider**, podemos fornecer um bloc para todos os widgets dessa subárvore. Nesse caso, podemos acessar o [CounterBloc](/2.bloc_access/local_access/lib/bloc/counter_bloc.dart) de dentro do [CounterPage](/2.bloc_access/local_access/lib/counter_page.dart)  widget e qualquer filho do [CounterPage](/2.bloc_access/local_access/lib/counter_page.dart) widget usando:
```dart
BlocProvider.of<CounterBloc>(context)
 ```

 O widget [CounterPage](/2.bloc_access/local_access/lib/counter_page.dart)  é um StatelessWidget que acessa o [CounterBloc](/2.bloc_access/local_access/lib/bloc/counter_bloc.dart) arquivo **BuildContext**.
 Nosso **CounterText** está usando a **BlocBuilder** para se reconstruir sempre que o estado [CounterBloc](/2.bloc_access/local_access/lib/bloc/counter_bloc.dart)  muda. Usamos ``BlocProvider.of<CounterBloc>(context)`` para acessar o fornecido [CounterBloc](/2.bloc_access/local_access/lib/bloc/counter_bloc.dart) e retornar um **Textwidget** com a contagem atual.

 [Documnetação oficial](https://bloclibrary.dev/#/recipesflutterblocaccess?id=local-access)