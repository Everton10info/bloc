## Generated Route Access
Neste exemplo, vamos criar um roteador e usar *BlocProvider* para acessar um bloc em várias rotas geradas. Vamos gerenciar os blocs que queremos escopo no roteador e fornecê-los seletivamente para as rotas que devem ter acesso.

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


[App](/2.bloc_access/generated_route_accesss/lib/main.dart): o widget do aplicativo raiz que gerencia o AppRouter.
[AppRouter](/2.bloc_access/generated_route_accesss/lib/app_router.dart): classe que irá gerenciar e fornecer o CounterBloc para as rotas geradas apropriadas.
[HomePage](/2.bloc_access/generated_route_accesss/lib/home_page.dart): o widget de contêiner que acessa o CounterBloc e expõe **FloatingActionButtons** para Incrementar e Decrementar o contador.
[CounterPage](/2.bloc_access/generated_route_accesss/lib/counter_page.dart): um widget que é responsável por exibir a contagem atual como uma rota separada.

* Nosso widget [App](/2.bloc_access/generated_route_accesss/lib/main.dart) é responsável por gerenciar a instância do [AppRouter](/2.bloc_access/generated_route_accesss/lib/app_router.dart) e usa o **onGenerateRoute** do roteador para determinar a rota atual.

* Precisamos descartar o **_router** quando o widget [App](/2.bloc_access/generated_route_accesss/lib/main.dart) for descartado para fechar todos os blocos no [AppRouter](/2.bloc_access/generated_route_accesss/lib/app_router.dart).

>[AppRouter](/2.bloc_access/generated_route_accesss/lib/app_router.dart). é responsável por gerenciar a instância do [CounterBloc](/2.bloc_access/generated_route_accesss/lib/bloc/counter_bloc.dart) e fornece **onGenerateRoute** que retorna a rota correta com base nas **RouteSettings** fornecidas.

>Como o [AppRouter](/2.bloc_access/generated_route_accesss/lib/app_router.dart) cria a instância [CounterBloc](/2.bloc_access/generated_route_accesss/lib/bloc/counter_bloc.dart), ele também deve expor um descarte que fecha a instância [CounterBloc](/2.bloc_access/generated_route_accesss/lib/bloc/counter_bloc.dart). descarte é chamado da substituição de descarte do widget **_AppState**.

>Estamos usando **BlocProvider.value** ao fornecer a instância Estamos usando BlocProvider.value ao fornecer a instância CounterBloc para as rotas porque não queremos que o BlocProvider manipule o descarte do bloco (já que AppRouter é responsável por isso). para as rotas porque não queremos que o **BlocProvider** manipule o descarte do bloco (já que [AppRouter](/2.bloc_access/generated_route_accesss/lib/app_router.dart) é responsável por isso).

* Quando o usuário toca no ElevatedButton, enviamos uma nova rota nomeada para navegar até a rota /counter que definimos acima.that).

* [CounterPage](/2.bloc_access/generated_route_accesss/lib/counter_page.dart) é um StatelessWidget super simples que usa o BlocBuilder para renderizar novamente um widget de texto com a contagem atual. Assim como antes, podemos usar BlocProvider.of<CounterBloc>(context) para acessar o CounterBloc.



[Documnetação oficial](https://bloclibrary.dev/#/recipesflutterblocaccess?id=anonymous-route-access)