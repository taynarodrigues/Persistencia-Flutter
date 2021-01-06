import 'dart:convert';

import 'package:ByteBankApp/models/contact.dart';
import 'package:ByteBankApp/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';



class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('headers:  ${data.headers}');
    print('body:  ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
      print(data);
      return data;
  }

}

   final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()],
   badCertificateCallback: (certificate, host, port) => true);
   

   const String baseUrl = 'http://192.168.108.13:8080/transactions';

Future<List<Transaction>> findAll() async{

    final Response response = await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson =  jsonDecode(response.body);
    final List<Transaction> transactions = List();
    for(Map<String, dynamic> transactionJson in decodedJson){
      final Map<String, dynamic> contactJson =   transactionJson['contact'];
      final Transaction transaction = Transaction(transactionJson['value'], Contact(0, contactJson['name'], contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
    }
    return transactions;
}

Future<Transaction> save(Transaction transaction) async {

final Map<String, dynamic> transactionMap = {
  'value': transaction.value,
  'contact': {
    'name':  transaction.contact.name,
    'accountNumber': transaction.contact.accountNumber
  }
};

final String transactionJson = jsonEncode(transactionMap);
  final Response response = await client.post(baseUrl, headers:  { 'Content-type': 'application/json', 'password': '1000',}, body: transactionJson );

  Map<String, dynamic> json = jsonDecode(response.body);
        final Map<String, dynamic> contactJson =   json['contact'];
        return  Transaction(json['value'], Contact(0, contactJson['name'], contactJson['accountNumber'],
      ),
    );
}