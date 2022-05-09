import 'dart:io';
import 'dart:convert';

main() async {
  var server = await HttpServer.bind('127.0.0.1', 4000);
  print('server started at ${server.address}:${server.port}');

  server.listen((event) {
    print(event.uri);
    switch (event.uri.toString()) {
      case '/':
        homeRouter(event);
        break;
/*       case '/addTask':
        addTask(event);
        break; */
      case '/delete':
        taskData.clear();
        break;
      default:
        if (event.uri.toString().startsWith('/addTask')) {
          addTask(event);
          break;
        }
    }
  });
}

List taskData = [];

void homeRouter(HttpRequest event) {
  var encoded = jsonEncode(taskData);

  event.response.headers.contentType =
      new ContentType('application', 'json', charset: 'utf-8');
  event.response.write(encoded);
  event.response.close();
}

void addTask(HttpRequest event) {
  //parse the query string
  var uri = Uri.parse(event.uri.toString());
  print(uri.queryParameters['task']);
  var data = {
    'fiyat': uri.queryParameters['fiyat'],
    'marka': uri.queryParameters['marka'],
  };
  taskData.add(data);

  event.response.headers.contentType =
      new ContentType('application', 'json', charset: 'utf-8');
  Uri redirectUri = Uri.http('localhost:4000', '/');
  event.response.redirect(redirectUri);
}
