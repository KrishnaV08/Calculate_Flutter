import "package:calculator_application_1/models/exchange.dart";
import "package:http/http.dart" as http;



class RemoteServices {
  Future<Exchange?>  getRates() async{
    var client= http.Client();
    var uri=Uri.parse("https://v6.exchangerate-api.com/v6/f67aee335c6fe9bceff39685/latest/USD");
    var response= await client.get(uri); 
    if(response.statusCode==200){
      var json= response.body; 
      return exchangeFromJson(json);
      
    }

    return null;
  }
}