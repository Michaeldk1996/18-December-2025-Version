import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

// const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateCheckoutSessionCall {
  static Future<ApiCallResponse> call({
    String? priceId = '',
    String? customerEmail = '',
    String? platform = '',
  }) async {
    final ffApiRequestBody = '''
{
  "priceId": "${priceId}",
  "customerEmail": "${customerEmail}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createCheckoutSession',
      apiUrl:
          'https://us-central1-bspconsult-bcd6e.cloudfunctions.net/createCheckoutSession',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'https://bspconsult.com/wp-json/remote-login/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SignupCall {
  static Future<ApiCallResponse> call({
    String? nonce = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'signup',
      apiUrl: 'https://bspconsult.com/api/user/register',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'username': "test112233",
        'nonce': nonce,
        'email': "test112233@gmail.com",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMemberShipDetailCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMemberShipDetail',
      apiUrl:
          'https://bspconsult.com/wp-json/pmpro/v1/get_membership_level_for_user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic RWR3YXJkOkZNNHIgU2phcSBYbzQ3IGhScU0gdXk3aCBiOTI2',
      },
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNonceCall {
  static Future<ApiCallResponse> call({
    String? controller = '',
    String? method = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getNonce',
      apiUrl: 'https://bspconsult.com/api/get_nonce/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'controller': controller,
        'method': method,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPasswordCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl: 'https://bspconsult.com/wp-json/bdpwr/v1/reset-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SetNewPasswordCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? code = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}",
  "code": "${code}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setNewPassword',
      apiUrl: 'https://bspconsult.com/wp-json/bdpwr/v1/set-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateAuthKeyCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'generateAuthKey',
      apiUrl: 'https://bspconsult.com/api/user/generate_auth_cookie',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'username': username,
        'password': password,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateMembershipLevelCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    int? levelId,
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "level_id": ${levelId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateMembershipLevel',
      apiUrl: 'https://bspconsult.com/wp-json/pmpro/v1/change_membership_level',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic RWR3YXJkOkZNNHIgU2phcSBYbzQ3IGhScU0gdXk3aCBiOTI2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMembershipLevelCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMembershipLevel ',
      apiUrl:
          'https://bspconsult.com/wp-json/pmpro/v1/get_membership_level_for_user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic RWR3YXJkOkZNNHIgU2phcSBYbzQ3IGhScU0gdXk3aCBiOTI2',
      },
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSubscriptionCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'createSubscription',
      apiUrl: 'https://bspconsult.com/wp-json/wc/v3/subscriptions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterUserCall {
  static Future<ApiCallResponse> call({
    String? userLogin = '',
    String? userPassword = '',
    String? userEmail = '',
    String? nonce = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'registerUser',
      apiUrl: 'https://bspconsult.com/api/users/create_user',
      callType: ApiCallType.GET,
      headers: {
        'X-WP-Nonce': 'f052084aa1',
      },
      params: {
        'u': "edward@edward.com",
        'p': "topstar1234\$",
        'user_login': userLogin,
        'user_password': userPassword,
        'user_email': userEmail,
        'nonce': nonce,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

// String _toEncodable(dynamic item) {
//   if (item is DocumentReference) {
//     return item.path;
//   }
//   return item;
// }

// String _serializeList(List? list) {
//   list ??= <String>[];
//   try {
//     return json.encode(list, toEncodable: _toEncodable);
//   } catch (_) {
//     if (kDebugMode) {
//       print("List serialization failed. Returning empty list.");
//     }
//     return '[]';
//   }
// }

// String _serializeJson(dynamic jsonVar, [bool isList = false]) {
//   jsonVar ??= (isList ? [] : {});
//   try {
//     return json.encode(jsonVar, toEncodable: _toEncodable);
//   } catch (_) {
//     if (kDebugMode) {
//       print("Json serialization failed. Returning empty json.");
//     }
//     return isList ? '[]' : '{}';
//   }
// }
