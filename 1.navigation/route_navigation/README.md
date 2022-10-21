## :boat: Route Navigation 

Nessa aplicação vamos usar **BlocListener** para navegar para uma página específica *(widget)* em resposta a uma mudança de estado em um bloco usando uma rota.

![aplicação](/1.navigation/route_navigation/assets/navigation_routes.gif)

## :pushpin:Bloco
Vamos construir **MyBloc** que irá pegar **MyEvents** e convertê-los em **MyStates**.

## :pushpin:MyEvent
Para simplificar, nosso [MyBloc](lib/bloc/my_bloc.dart) responderá apenas a dois [MyEvent](lib/bloc/my_event.dart): **EventA** e **EventB**.

## :pushpin:MyState

* **StateA** - O estado do bloco quando a **PageA** é renderizada.

* **StateB** - O estado do bloco quando a **PageB** é renderizada.

## :pushpin:MyBloc

Nosso [MyBloc](lib/bloc/my_bloc.dart) ficará assim:

```dart 
import 'package:bloc/bloc.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(StateA()) {
    on<EventA>((event, emit) => emit(StateA()));
    on<EventB>((event, emit) => emit(StateB()));
  }
}
```
##Camada de UI

Nessa [camada](lib/main.dart) conectamos nosso [MyBloc](lib/bloc/my_bloc.dart) a um widget e mostramos uma página diferente com base no estado do bloco.


 > :warning: Por causa deste exemplo, estamos adicionando um evento apenas para navegação. Em um aplicativo real, você não deve criar eventos de navegação explícitos. Se não houver "lógica de negócios" necessária para acionar a navegação, você deve sempre navegar diretamente em resposta à entrada do usuário (no onPressed retorno de chamada, etc...). Navegue apenas em resposta a alterações de estado se alguma "lógica de negócios" for necessária para determinar para onde navegar.

[Documentação oficial](https://bloclibrary.dev/#/recipesflutternavigation?id=route-navigation)
