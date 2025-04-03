import 'package:machine_backend/database/database.dart';
import 'package:machine_backend/handlers/handlers.dart';
import 'package:machine_backend/handlers/websocket_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

// TODO(Roman): remove print and [insertMockMachinesIfEmpty] after testing.
void main() async {
  final db = AppDatabase();
  await db.insertMockMachinesIfEmpty();

  final api = MachineApi(db);
  final wsHandler = WebSocketHandler(db);

  final handler = Cascade().add(api.handler).add(wsHandler.handler).handler;

  final server = await io.serve(handler, 'localhost', 8080);
  print('Server started on port ${server.port}');
}
