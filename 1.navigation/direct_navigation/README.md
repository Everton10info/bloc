# :boat:Direct Navigation

Nessa aplicação veremos como usar **BlocBuilder** para mostrar uma página específica (widget) em resposta a uma mudança de estado em um bloco sem o uso de uma rota.

![aplicação](assets/navigation_direct.gif)

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

 > :warning: Usamos o widget BlocBuilder para renderizar o widget correto em resposta às mudanças de estado em nosso arquivo MyBloc.
 > Usamos o widget BlocProvider widget para disponibilizar nossa instância de MyBlocpara toda a árvore de widgets.

[Documentação Oficial](https://bloclibrary.dev/#/recipesflutternavigation?id=direct-navigation)