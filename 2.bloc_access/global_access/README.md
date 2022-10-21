## :earth_americas: Global Access
Neste exemplo, vamos demonstrar como tornar uma instância de bloco disponível para toda a árvore de widgets. Isso é útil para casos específicos como um **AuthenticationBloc** ou **ThemeBloc** porque esse estado se aplica a todas as partes do aplicativo.

## :pushpin: Bloc
Por uma questão de simplicidade, vamos usar a Counter como nosso aplicativo de exemplo.

Nossa **CounterBloc** implementação ficará assim:

``` dart 

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}
```
## :pushpin:IU

Teremos 3 eremos três partes na interface do usuário do nosso aplicativo:


[App](/2.bloc_access/global_access/lib/main.dart): o widget do aplicativo raiz que gerencia a instância global do nosso [CounterBloc](/2.bloc_access/global_access/lib/bloc/counter_bloc.dart).

[CounterPage](/2.bloc_access/global_access/lib/counter_page.dart): o widget de contêiner que expõe **FloatingActionButtons** para incrementar e decrementar o contador.

[CounterText](/2.bloc_access/global_access/lib/counter_text.dart): um widget de texto que é responsável por exibir a contagem atual.


* O [App](/2.bloc_access/global_access/lib/main.dart) gerencia a criação, fechamento e fornecimento do [CounterBloc](/2.bloc_access/global_access/lib/bloc/counter_bloc.dart) para a subárvore usando **BlocProvider**. A principal diferença é que, neste caso, MaterialApp é filho de **BlocProvider**.

* Envolver todo o **MaterialApp** em um **BlocProvider** é a chave para tornar nossa instância CounterBloc globalmente acessível. Agora podemos acessar nosso [CounterBloc](/2.bloc_access/global_access/lib/bloc/counter_bloc.dart) de qualquer lugar em nossa aplicação onde tenhamos um **BuildContext** usando `BlocProvider.of<CounterBloc>(context);`

:warning: ` Essa abordagem ainda funciona se você estiver usando um CupertinoApp ou WidgetsApp.`


> Nosso [CounterPage](/2.bloc_access/global_access/lib/counter_page.dart) é um **StatelessWidget** porque não precisa gerenciar nenhum estado próprio. Assim como mencionamos acima, ele usa `BlocProvider.of<CounterBloc>(context)` para acessar a instância global do [CounterBloc](/2.bloc_access/global_access/lib/bloc/counter_bloc.dart)



[Documnetação oficial](https://bloclibrary.dev/#/recipesflutterblocaccess?id=anonymous-route-access)