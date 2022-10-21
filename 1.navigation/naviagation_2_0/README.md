##:ship: Navigation 2.0

Neste exemplo, veremos como usar a API de páginas do Navigator 2.0 para lidar com roteamento em resposta a mudanças de estado em um bloc.

**Observação**: vamos usar package: [flow_builder](https://pub.dev/packages/flow_builder) para simplificar o trabalho com a API do Navigator 2.0.

## :pushpin: Bloc
Para mostrar as vantagens do Navigator, vamos construir um exemplo um pouco mais complexo. Vamos construir o [BookBloc](/1.navigation/naviagation_2_0/lib/bloc/book_bloc.dart) que os levará [BookEvent](/1.navigation/naviagation_2_0/lib/bloc/book_event.dart) se os converterá em [BookStates](/1.navigation/naviagation_2_0/lib/bloc/book_state.dart).

## :pushpin:  BookEvent

[BookEvent](/1.navigation/naviagation_2_0/lib/bloc/book_event.dart) responderá a dois eventos: selecionar um livro e desmarcar um livro.

## :pushpin:  BookState
[BookStates](/1.navigation/naviagation_2_0/lib/bloc/book_state.dart) conterá a lista de livros e um livro opcional selecionado se o usuário tocar em um livro.
## :pushpin:  Bloco de Livros
[BookBloc](/1.navigation/naviagation_2_0/lib/bloc/book_bloc.dart)  lidará com a resposta a cada um [BookEvent](/1.navigation/naviagation_2_0/lib/bloc/book_event.dart)  emitirá a [BookStates](/1.navigation/naviagation_2_0/lib/bloc/book_state.dart) resposta apropriada:
## :pushpin: Camada de UI

Agora vamos conectar o bloco à nossa interface do usuário usando [FlowBuilder](https://pub.dev/packages/flow_builder)!

[Documentação oficial](https://bloclibrary.dev/#/recipesflutternavigation?id=navigation-20)