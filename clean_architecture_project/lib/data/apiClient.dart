import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class ApiBridge {
  String apiUrl = 'http://numbersapi.com/';
  
  Future<String> numberFact(int n) async
  {
    String fact = '';

    Uri uri = Uri.parse(apiUrl+n.toString());
    http.Response rp = await http.get(uri);

    if(rp.statusCode == 200)
    {
      String data = rp.body;
      fact =  data; 
    }
    
    return fact;
  }


  Future<String> numberFactRandom() async
  {
     String fact = '';

    Uri uri = Uri.parse(apiUrl+randomNumber().toString());
    http.Response rp = await http.get(uri);

    if(rp.statusCode == 200)
    {
      String data = rp.body;
      fact =  data; 
    }
    
    return fact;
  }

  int randomNumber()
  {
    var rng = Random();

    return rng.nextInt(9999);
  }
}