import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:dw_desafio_dia1/modules/menu/@core/models/menu.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'menu_controller.g.dart';

class MenuController {
  @Route.get('/')
  Future<Response> listMenu(Request request) async {
    try {
      final conn = await MySqlConnection.connect(ConnectionSettings(
        host: env['databaseHost'],
        port: int.parse(env['databasePort']),
        user: env['databaseUser'],
        password: env['databasePassword'],
        db: env['databaseName'],
      ));

      final result = await conn.query('select * from cardapio_grupo_item');

      conn?.close();

      if (result.isNotEmpty) {
        final menus = result.map<Menu>((row) {
          return Menu(
            id: row['id_cardapio_grupo_item'],
            nome: row['nome'],
            preco: row['valor'],
          );
        }).toList();

        return Response.ok(jsonEncode(menus.map((e) => e.toJson()).toList()));
      }

      return Response.ok(jsonEncode([]));
    } catch (e) {
      print(e);
      return Response.internalServerError();
    }
  }

  Router get router => _$MenuControllerRouter(this);
}
