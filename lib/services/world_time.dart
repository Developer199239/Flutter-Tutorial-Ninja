import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class WorldTime{
  String location = "";
  String time = "";
  String flag = "";
  String url = "";

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    print('====start===');
    var makeUrl = Uri.http('worldtimeapi.org', '/api/timezone/$url', {'q': '{http}'});
    var response = await http.get(makeUrl);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      //get properties from data
      String datetime = jsonResponse['utc_datetime'];
      String offset = jsonResponse['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      time = now.toString();
      print('====success===');
    } else {
      print('====Failed===');
    }
  }
}