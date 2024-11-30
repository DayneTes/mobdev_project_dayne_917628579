import 'package:dt917628579_a1_f24/model/helpRequests.dart';
import 'package:dt917628579_a1_f24/model/meals.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Meals>?> getMeals() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:8080/api/v1/meal/');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      client.close();
      return mealsFromJson(response.body);
    } else {
      client.close();
      return null;
    }
  }

  Future<List<Meals>?> getBreakfast() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:8080/api/v1/meal/breakfast');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      client.close();
      return mealsFromJson(response.body);
    } else {
      client.close();
      return null;
    }
  }

  Future<List<Meals>?> getLunch() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:8080/api/v1/meal/lunch');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      client.close();
      return mealsFromJson(response.body);
    } else {
      client.close();
      return null;
    }
  }

  Future<List<Meals>?> getDinner() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:8080/api/v1/meal/dinner');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      client.close();
      return mealsFromJson(response.body);
    } else {
      client.close();
      return null;
    }
  }

  void orderMeal(String name, String type, int combo) async {
    var client = http.Client();
    var full = 'http://localhost:8080/api/v1/meal/$type/$combo?name=$name';

    var uri = Uri.parse(full);

    var response = await client.post(uri);

    if (response.statusCode == 200) {
      client.close();
      print('Ordered $type/$combo');
    } else {
      client.close();
      return null;
    }
  }

  void sendHelp(String type, String user) async {
    var client = http.Client();
    var full = 'http://localhost:8080/api/v1/help';
    var helpRequest = HelpRequest(requestedBy: user, type: type);

    String requestBody = helpRequestToJson(helpRequest);

    var response = await http.post(
      Uri.parse(full),
      headers: {
        "Content-Type": "application/json",
      },
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print(helpRequest.toString());
      client.close();
    } else {
      client.close();
      return null;
    }
  }
}
