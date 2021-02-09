import 'package:dw_desafio_dia1/modules/menu/menu_router.dart';

import './i_router_configure.dart';
import 'package:shelf_router/shelf_router.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouterConfigure> routers = [
    MenuRouter(),
  ];

  RouterConfigure(this._router);

  void configure() => routers.forEach((r) => r.configure(_router));
}
