import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';
import 'package:depifinalproject/core/utils/app_backend_endpoints.dart';
import 'package:depifinalproject/feature/home/data/model/order_model.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class OrderRepoImpltation extends OrderRepo {
  final DataBaseServies dataBaseServies;

  OrderRepoImpltation(this.dataBaseServies);

  @override
  Future<Either<Failure, void>> addNewOrders({
    required OrderEntity order,
  }) async {
    try {
      await dataBaseServies.addData(
        documentID: order.uIdOrder,
        path: AppBackendEndpoints.ordercollection,
        data: OrderModel.fromEntity(order).toMap(),
      );

      return right(null);
    }
    //  on CustomExpetion catch (e) {
    //   log(
    //     'the expetion happened  in add new order in  Order repo impltation is : ${e.message}',
    //   );
    //   return left(ServerFailure(message: e.message));
    // }
    catch (e) {
      return left(
        ServerFailure(
          message:
              'حدث خطأ غير متوقع أثناء إضافة الطلب. يرجى المحاولة مرة أخرى.$e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>>
  getAllMyAccetsOrderforDelivery() async {
    try {
      var data = await dataBaseServies.readSpecificData(
        path: AppBackendEndpoints.ordercollection,
        query: {},
      );
      // as List<Map<String, dynamic>>;
      final ordersList = data
          .map((item) => OrderModel.fromJson(item).toEntity())
          .toList();
      return right(ordersList);
    } catch (e) {
      log('the expextion happen in getAllMyAccetsOrderforDelivery fun $e');
      return left(ServerFailure(message: 'فشل في جلب البيانات'));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getAllMyOrdersforClient() async {
    try {
      var data =
          await dataBaseServies.readSpecificData(
                path: AppBackendEndpoints.ordercollection,
                query: {'createdBy': getUserData().userID},
              )
              as List<Map<String, dynamic>>;
      final ordersList = data
          .map((item) => OrderModel.fromJson(item).toEntity())
          .toList();
      return right(ordersList);
    } catch (e) {
      log('the expextion happen in getAllMyAccetsOrderforDelivery fun $e');
      return left(ServerFailure(message: 'فشل في جلب البيانات $e'));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getAllOrdersforDelivery() async {
    try {
      var data =
          await dataBaseServies.readData(
                path: AppBackendEndpoints.ordercollection,
              )
              as List<Map<String, dynamic>>;
      final ordersList = data
          .map((item) => OrderModel.fromJson(item).toEntity())
          .toList();
      return right(ordersList);
    } catch (e) {
      log('the expextion happen in getAllMyAccetsOrderforDelivery fun $e');
      return left(ServerFailure(message: 'فشل في جلب البيانات $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteOrderByClinet({
    required String orderId,
  }) async {
    try {
      await dataBaseServies.deletedata(
        path: AppBackendEndpoints.ordercollection,
        dataId: orderId,
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          message: 'حدف مشكله اثناء الحدف الرجاء الحاوله في وقت اخر $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderByClinet({
    required String orderId,
    required OrderEntity newUpDatedOrder,
    required OrderEntity oldOrder,
  }) async {
    Map<String, dynamic> newOrderData = OrderModel.fromEntity(
      newUpDatedOrder,
    ).toMap();
    Map<String, dynamic> oldOrderData = OrderModel.fromEntity(oldOrder).toMap();

    try {
      final Map<String, dynamic> changes = {};
      newOrderData.forEach((key, value) {
        if (oldOrderData[key] != value) {
          changes[key] = value;
        }
      });
      if (changes.isEmpty) return right(null);
      await dataBaseServies.upDatadata(
        path: AppBackendEndpoints.ordercollection,
        dataId: orderId,
        data: changes,
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(message: 'حدث مشكله اثناء تحديث البيانات'));
    }
  }
}
