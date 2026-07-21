abstract class HomeEvent {
  const HomeEvent();
}

class LoadHomeEvent extends HomeEvent {
  const LoadHomeEvent();
}

class ChangeBottomNavEvent extends HomeEvent {
  final int index;

  const ChangeBottomNavEvent(this.index);
}
