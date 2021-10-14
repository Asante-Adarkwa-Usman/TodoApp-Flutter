import 'package:http/http.dart';

class TodoService {
  Future<Response> getAllTodoRequest() async {
    return await get(Uri.parse("https://dog-9-e-u-a-9-.cyclic-app.com/todos"));
  }

//get todo by id
  Future<Response> getTodoByIdRequest(String id) async {
    return await get(
        Uri.parse("https://dog-9-e-u-a-9-.cyclic-app.com/todos/$id"));
  }

  //create new todo
  Future<Response> createTodo(
      {required String title,
      required String description,
      required String dateTime}) async {
    Map<String, String> body = {
      "title": title,
      "description": description,
      "date_time": dateTime,
    };
    return await post(Uri.parse("https://dog-9-e-u-a-9-.cyclic-app.com/todo"),
        body: body);
  }

  //update todo status
  Future<Response> updateTodoRequest(
      {required bool status, required String id}) async {
    Map<String, bool> body = {
      "status": status,
    };
    return await patch(
        Uri.parse("https://dog-9-e-u-a-9-.cyclic-app.com/todos/$id"),
        body: body);
  }

  //delete todo
  Future<Response> deleteTodoRequest(String id) async {
    return await delete(
        Uri.parse("https://dog-9-e-u-a-9-.cyclic-app.com/todos/$id"));
  }
}
