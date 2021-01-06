
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';



   final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()],
   badCertificateCallback: (certificate, host, port) => true);
   

   const String baseUrl = 'http://192.168.108.13:8080/transactions';
