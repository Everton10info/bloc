## Anonymous Route Access
Neste exemplo, usaremos **BlocProvider** para acessar um bloco entre rotas. Quando uma nova rota é empurrada, ela terá uma diferente **BuildContext** que não tem mais referência aos blocs fornecidos anteriormente. Como resultado, temos que envolver a nova rota em um arquivo **BlocProvider**..

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


 [App](/2.bloc_access/anonymous_route_access/lib/main.dart): o widget do aplicativo raiz.
 [HomePage](/2.bloc_access/anonymous_route_access/lib/home_page.dart): o widget de contêiner que gerenciará a exposição [CounterBloc](2.bloc_access/anonymous_route_access/lib/bloc/counter_bloc.dart) e o contador. **FloatingActionButtons   Increment  Decrement**
 [CounterPage](/2.bloc_access/anonymous_route_access/lib/counter_page.dart): um widget que é responsável por exibir a atual countcomo uma rota separada.


 O [HomePage](/2.bloc_access/anonymous_route_access/lib/home_page.dart) é semelhante ao do [CounterPage](/2.bloc_access/anonymous_route_access/lib/counter_page.dart); no entanto, em vez de renderizar um CounterText widget, ele renderiza um ElevatedButton no centro que permite ao usuário navegar para uma nova tela que exibe a contagem atual.

Quando o usuário toca no **ElevatedButton**, enviamos um novo **MaterialPageRoute** e retornamos o [CounterPage](/2.bloc_access/anonymous_route_access/lib/counter_page.dart). No entanto, estamos envolvendo o **CounterPage** em um **BlocProvider** para disponibilizar a instância atual do [CounterBloc](2.bloc_access/anonymous_route_access/lib/bloc/counter_bloc.dart) na próxima página.


>:warning: É fundamental que estejamos usando o construtor de valor de BlocProvider neste caso porque estamos fornecendo uma instância existente de CounterBloc. O construtor de valor de BlocProvider deve ser usado apenas nos casos em que queremos fornecer um bloco existente para uma nova subárvore. Além disso, usar o construtor de valor não fechará o bloco automaticamente o que, neste caso, é o que queremos (já que ainda precisamos que o CounterBloc funcione nos widgets ancestrais). Em vez disso, simplesmente passamos o CounterBloc existente para a nova página como um valor existente em oposição a um construtor. Isso garante que o único BlocProvider de nível superior lide com o fechamento do CounterBloc quando ele não for mais necessário.

[Documnetação oficial](https://bloclibrary.dev/#/recipesflutterblocaccess?id=anonymous-route-access)