import 'package:dw_desafio_dia1/application/routers/i_router_configure.dart';
import 'package:dw_desafio_dia1/modules/menu/controller/menu_controller.dart';
import 'package:shelf_router/shelf_router.dart';

class MenuRouter implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.mount('/menu/', MenuController().router);
  }
}
