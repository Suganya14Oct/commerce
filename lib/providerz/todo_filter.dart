import 'package:commerce/models/todo_models.dart';
import 'package:flutter/cupertino.dart';

class TodoFilterState {

  final Filter filter;
  TodoFilterState({required this.filter});

  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.hottest);
  }

  @override
  List<Object> get props => [filter];

  @override
  bool get stringify => true;

  TodoFilterState copyWith({
    Filter? filter,
  }){
    return TodoFilterState(filter: filter ?? this.filter);
  }
}

class TodoFilter with ChangeNotifier {

  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  void changeFilter(Filter newFilter){
    _state = _state.copyWith(filter: newFilter);
    notifyListeners();
  }

}