// import 'dart:io';
// import 'dart:js';

// import 'package:auto_route/auto_route.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:provider/provider.dart';
// import 'package:restaraunts/routes/router.gr.dart';
// import 'package:restaraunts/services/tokens.dart';

// final apiProvider = Provider(create: (ref) => SessionManager());

// final _emailController = TextEditingController();
// final _passwordController = TextEditingController();

// Future<void> login() async {
//   if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
//     Dio dio = Dio();
//     dio.interceptors.add(PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: true,
//         error: true,
//         compact: true,
//         maxWidth: 90));
//     try {
//       apiProvider;
//       var response = await dio.post(
//         ("85.193.80.64:3001/auth/signIn"),
//         data: {
//           "number": _emailController.text,
//           HttpHeaders.contentTypeHeader: 'application/json'
//         },
//       );
//       if (response.statusCode == 201) {
//         print(response.data!.keys);
//         final token = response.data!['token'];
//         SessionManager().updatetoken(token);
//         context.router.replaceAll(const BottomNavPageRoute());
//       } else {
//         showError();
//       }
//     } catch (e) {}
//   }
// }
