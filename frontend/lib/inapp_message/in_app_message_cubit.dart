import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:frontend/inapp_message/utils.dart';
import 'package:http/http.dart' as http;

part 'in_app_message_state.dart';

class InAppMessageCubit extends Cubit<InAppMessageState> {
  InAppMessageCubit() : super(InitialState()) {
    _javascriptRuntime = getJavascriptRuntime();
    _javascriptRuntime.onMessage('onSuccess', _handleOnSuccess);
    _javascriptRuntime.onMessage('onFailure', _handleOnFailure);
  }

  late JavascriptRuntime _javascriptRuntime;
  Map _context = {};

  Future<void> runJs({required Map event}) async {
    try {
      final script = await _downloadScript();
      if (script == null) {
        return;
      }
      final payload = {
        'event': event,
        'context': _context,
      };
      final code = '''
        var payload = $payload;
        $script
      ''';
      final result = await _javascriptRuntime.evaluateAsync(code);
      if (result.isError) {
        throw result.stringResult;
      }
    } catch (e) {
      // Do nothing
    }
  }

  Future<String?> _downloadScript() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8000/script'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void _handleOnSuccess(dynamic args) {
    final context = args['context'];
    if (context != null && context is Map) {
      _context = context;
    }
    final message = args['message'];
    if (message != null && message is Map) {
      final config = nonNull(message['config']) as Map;
      final type = nonNull(message['type']);
      if (type == 'BottomSheet') {
        emit(BottomSheetState(config));
      } else if (type == 'Dialog') {
        emit(DialogState(config));
      } else if (type == 'Banner') {
        emit(BannerState(config));
      }
    }
  }

  void _handleOnFailure(dynamic args) {
    // Do nothing
  }
}
