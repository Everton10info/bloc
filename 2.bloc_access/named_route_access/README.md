## Named Route Access
Neste exemplo, usaremos **BlocProvider** para acessar um bloco em várias rotas nomeadas. Quando uma nova rota nomeada é enviada, ela terá uma rota diferente BuildContext que não tem mais referência aos blocs fornecidos anteriormente. Neste caso, vamos gerenciar os blocs que queremos escopo no widget pai e fornecê-los seletivamente para as rotas que devem ter acesso.

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


 [App](/2.bloc_access/named_route_access/lib/main.dart): o widget do aplicativo raiz que gerencia o CounterBloce o fornece às rotas nomeadas apropriadas.
[HomePage](/2.bloc_access/named_route_access/lib/home_page.dart): o widget de contêiner que acessa [CounterBloc](/2.bloc_access/named_route_access/lib/bloc/counter_bloc.dart) 
[CounterPage](/2.bloc_access/named_route_access/lib/counter_page.dart): um widget que é responsável por exibir a atual **count** como uma rota separada.


 

Nosso widget [App](/2.bloc_access/named_route_access/lib/main.dart) é responsável por gerenciar a instância do [CounterBloc](/2.bloc_access/named_route_access/lib/bloc/counter_bloc.dart) , que forneceremos para as rotas raiz **(/)** e counter **(/counter)**.


>:warning: É fundamental entender que, como o _AppState está criando a instância CounterBloc, ele também deve fechá-la na substituição de descarte.
>
>Estamos usando BlocProvider.value ao fornecer a instância CounterBloc para as rotas porque não queremos que o BlocProvider manipule o descarte do bloco (já que _AppState é responsável por isso).

* É fundamental entender que, como o _AppState está criando a instância [CounterBloc](/2.bloc_access/named_route_access/lib/bloc/counter_bloc.dart), ele também deve fechá-la na substituição de descarte.

* CounterPage é um **StatelessWidget** super simples que usa o **BlocBuilder** para renderizar novamente um widget de texto com a contagem atual. Assim como antes, podemos usar   ***BlocProvider.of<CounterBloc>(context)*** para acessar o [CounterBloc](/2.bloc_access/named_route_access/lib/bloc/counter_bloc.dart).

[Documentação oficial](https://bloclibrary.dev/#/recipesflutterblocaccess?id=anonymous-route-access)

