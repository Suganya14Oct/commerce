import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';

Uuid uuid = Uuid();

class Username extends Equatable {
  final String id;
  final String name;

  Username({String? id, required this.name}) : id = id ?? uuid.v4();

  @override
  List<Object?> get props => [id, name];

  @override
  bool get stringify => true;
}


