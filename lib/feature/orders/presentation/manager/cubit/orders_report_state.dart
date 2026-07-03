import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

abstract class OrdersReportState {}

class OrdersReportInitial extends OrdersReportState {}

class OrdersReportLoading extends OrdersReportState {}

class OrdersReportFailure extends OrdersReportState {
  final String message;

  OrdersReportFailure(this.message);
}

class OrdersReportSuccess extends OrdersReportState {
  final List<OrderEntity> orders;

  final int allOrders;

  final int waitingAccept;

  final int waitingDelivery;

  final int onWay;

  final int delivered;

  final int returned;

  final double parcelPrice;

  OrdersReportSuccess({
    required this.orders,
    required this.allOrders,
    required this.waitingAccept,
    required this.waitingDelivery,
    required this.onWay,
    required this.delivered,
    required this.returned,
    required this.parcelPrice,
  });
}
