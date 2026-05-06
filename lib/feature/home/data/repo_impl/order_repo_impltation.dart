import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
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
        path: AppBackendEndpoints.orderCollention,
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
  Future<Either<Failure, List<OrderEntity>>> getAllOrders() {
    // TODO: implement getAllOrders
    throw UnimplementedError();
  }
}
