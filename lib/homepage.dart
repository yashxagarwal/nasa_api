import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nasa_api/models/api_response.dart';
import 'package:nasa_api/services/api_services.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FutureBuilder<Apimodel?>(builder: (_, snapshot) {
        if(snapshot.hasData){
        Apimodel? apimodel = snapshot.data;
          return Scaffold(body: Stack(
            children: [
              Image.network(apimodel!.url,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0,20.0,100.0),
                child: Align(alignment: Alignment.bottomLeft,child: Text(apimodel.title, style: TextStyle(color: Colors.white, fontSize: 30), )),
              )
            ],
          )
          ,
          
          );
        }else {return Text('no data');}
      },
      future: apiService.getApiResults(),)),
    );
  }
}