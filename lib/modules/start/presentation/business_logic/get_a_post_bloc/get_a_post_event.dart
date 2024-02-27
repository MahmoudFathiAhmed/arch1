part of 'get_a_post_bloc.dart';

class GetAPostEvent extends Equatable {
  final int id;

  const GetAPostEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

