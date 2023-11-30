import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AppConfig {
  static const int NO_UPDATE = 0;
  static const int FORCE_UPDATE = 1;
  static const int OPTIONAL_UPDATE = 2;

  // int get normalUpdate => 2;
  static final _config = AppConfig._internal();
  late final int _timeZoneOffset;
  AppConfig._internal();

  factory AppConfig() {
    _config._timeZoneOffset = DateTime.now().timeZoneOffset.inMinutes;
    return _config;
  }

  // static const String _prodUrl = "https://url";
  final String _baseUrl = "https://api.imgflip.com/";
  int _updateStatus = 0;
  int get updateStatus => _updateStatus;
  String get basePath => _baseUrl;
  int get timeZoneOffset => _config._timeZoneOffset;
  final String _appStoreUrl = "";
  final String _playStoreUrl = "";
  String get appStoreUrl => _appStoreUrl;
  String get playStoreUrl => _playStoreUrl;
  String? _privacyUrl;
  String? _termsUrl;
  bool _subscriptionActive = false;
  bool _adEngineActive = false;
  List<String> _versionList = [];
  String offensiveWords = "";
  String instantMsgBody = "";
  StreamSubscription? _appConfigSubscriber;
  String? get termsUrl => _termsUrl;
  String? get privacyUrl => _privacyUrl;
  bool get subscriptionON => _subscriptionActive;
  bool get adEngineActive => _adEngineActive;

  final PublishSubject<bool> _firebasePublisher = PublishSubject();
  PublishSubject<bool> get firebasePublisher => _firebasePublisher;

  void readAppConfig() async {}

  void _onError(final _error) {
    debugPrint("IA AM DONE");
  }

  void dispose() async {
    if (_appConfigSubscriber != null) {
      _appConfigSubscriber?.cancel();
    }
    _firebasePublisher.close();
  }
}

final AppConfig appConfig = AppConfig();
