import 'dart:convert';

import 'package:api/Model/livestreammodel.dart';
import 'package:api/Model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

String? tokens;

class Api {
  Future<Temperatures?> getdata() async {
    var data = await get(Uri.parse("https://ws.api.video/videos"), headers: {
      "Authorization":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3MDI4OTg5MDEuNzA5NDIsIm5iZiI6MTcwMjg5ODkwMS43MDk0MiwiZXhwIjoxNzAyOTAyNTAxLjcwOTQyLCJwcm9qZWN0SWQiOiJwcm9qZWN0XzFDNkgxeHVLWkFmYjgyTjhYNDVnTEgiLCJhcGlLZXkiOiJhcGlfa2V5XzFDNkgxeHVqOUh5eXZ4aFdNTGFmTnoifQ.pYKdTo_2x405o4yzQX4BYgjAGr0W9K7Qxfn0q_o40kyNM534YCIpuqkTCmOHQDwz3Aocj20_bQkn_RJ_lvbchYy4sJ7_lZNyONC8yNgV-eg4gTN9PwnUoMrHmsjXnS-OkvgRCx28jjvgtMDu1tWy6Yt5CdvX0JzstoMY2_6EcMGWxXjyaLkMtVQjBdIGX0cwKOYa9oUkLcSMJmv8J_9XMxyfioqLhxtJRE9TP9p3YttQnvNPyddcaPZMexIxQib4ZTk9FOIx_vQ68uchCs-mq6iJa9_Xt3eyu4_hygcT2vSXQokuTG-QkMRqHiyDc5eVwyvvHDv1xtiRDyx1AZy8Xg"
    });
    if (data.statusCode == 200) {
      final ds = jsonDecode(data.body);
      Temperatures re = Temperatures.fromJson(ds);
      return re;
    }
    return null;
  }

  Future<LiveStreamdf?> getdatas() async {
    var data =
        await get(Uri.parse("https://ws.api.video/live-streams"), headers: {
      "Authorization":
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3MDI4OTg5MDEuNzA5NDIsIm5iZiI6MTcwMjg5ODkwMS43MDk0MiwiZXhwIjoxNzAyOTAyNTAxLjcwOTQyLCJwcm9qZWN0SWQiOiJwcm9qZWN0XzFDNkgxeHVLWkFmYjgyTjhYNDVnTEgiLCJhcGlLZXkiOiJhcGlfa2V5XzFDNkgxeHVqOUh5eXZ4aFdNTGFmTnoifQ.pYKdTo_2x405o4yzQX4BYgjAGr0W9K7Qxfn0q_o40kyNM534YCIpuqkTCmOHQDwz3Aocj20_bQkn_RJ_lvbchYy4sJ7_lZNyONC8yNgV-eg4gTN9PwnUoMrHmsjXnS-OkvgRCx28jjvgtMDu1tWy6Yt5CdvX0JzstoMY2_6EcMGWxXjyaLkMtVQjBdIGX0cwKOYa9oUkLcSMJmv8J_9XMxyfioqLhxtJRE9TP9p3YttQnvNPyddcaPZMexIxQib4ZTk9FOIx_vQ68uchCs-mq6iJa9_Xt3eyu4_hygcT2vSXQokuTG-QkMRqHiyDc5eVwyvvHDv1xtiRDyx1AZy8Xg"
    });
    if (data.statusCode == 200) {
      final dsa = jsonDecode(data.body);
      LiveStreamdf res = LiveStreamdf.fromJson(dsa);
      return res;
    }
    return null;
  }

  Future<String?> getAccessToken() async {
    try {
      final response = await post(
        Uri.parse("https://ws.api.video/auth/api-key"),
        body: {"apiKey": "JCe6HoaaEy92BJYN0nWvkhaIfGrXNas3Z6WNN2QIvz8"},
      );

      if (response.statusCode == 200) {
        // Successful request
        var responseData = jsonDecode(response.body);
        String accessToken = responseData["access_token"];
        tokens = accessToken;
        print("Access Token: $tokens");
      } else {
        // Request failed with an error code
        print("Error: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (error) {
      // Exception during the request
      print("Error: $error");
    }
  }
}

final ass = Provider(
  (ref) => Api(),
);
final asd = FutureProvider.autoDispose(((ref) {
  final asdx = ref.watch(ass);

  return asdx.getdata();
}));
final live = FutureProvider.autoDispose(((ref) {
  final asdx = ref.watch(ass);

  return asdx.getdatas();
}));

///get token


///
///
///pass token

