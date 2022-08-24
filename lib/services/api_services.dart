import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nasa_api/models/api_response.dart';

class ApiService{

  Future <Apimodel?> getApiResults() async{
    http.Response response;
    response = await http.get(Uri.parse('https://api.nasa.gov/planetary/apod?api_key=SNZ0vLxDUj3fcm4CZJQ0m0bfgjvDiO8e8qq8ATeV'));
    if(response.statusCode == 200){
    Apimodel apimodel = Apimodel.fromJson(jsonDecode(response.body));
        print('api yes');
    return apimodel;
    }else {
        print('api no');
      return null;
    
    }
  }
}