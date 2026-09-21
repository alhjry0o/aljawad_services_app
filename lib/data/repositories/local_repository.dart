import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/request_model.dart';

final requestRepositoryProvider = Provider((ref) => LocalRequestRepository());

abstract class RequestRepository {
  Future<List<ServiceRequestModel>> getRequests();
  Future<void> saveRequest(ServiceRequestModel request);
}

class LocalRequestRepository implements RequestRepository {
  static const _key = 'user_requests';

  @override
  Future<List<ServiceRequestModel>> getRequests() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key) ?? [];
    return data.map((e) => ServiceRequestModel.fromJson(jsonDecode(e))).toList();
  }

  @override
  Future<void> saveRequest(ServiceRequestModel request) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getRequests();
    list.add(request);
    final encoded = list.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_key, encoded);
  }
}