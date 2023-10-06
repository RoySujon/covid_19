import 'dart:convert';

import 'package:covid_19/View/world_state.dart';
import 'package:covid_19/data/url/app_url.dart';
import 'package:covid_19/model/world_states.dart';
import 'package:http/http.dart';

class StateServices {
  Future<WorldStatesModel> fetchWorldStatesData() async {
    final res = await get(Uri.parse(AppUrl.worldStatesApi));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
