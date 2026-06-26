
abstract class UpdateSimpleOrderState {}

class UpdateSimpleOrderInitial extends UpdateSimpleOrderState {}

class UpdateSimpleOrderLoading extends UpdateSimpleOrderState {}

class UpdateSimpleOrderSuccess extends UpdateSimpleOrderState {}

class UpdateSimpleOrderFailure extends UpdateSimpleOrderState {
  final String message;

  UpdateSimpleOrderFailure(this.message);
}
