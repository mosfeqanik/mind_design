import 'package:flutter/material.dart';

class InitializationProvider with ChangeNotifier {
  Future<void>? _initializationFuture;

  Future<void> get initializationFuture {
    _initializationFuture ??= _initialize();
    return _initializationFuture!;
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 5));
    notifyListeners(); // Notify listeners when done
  }
}
