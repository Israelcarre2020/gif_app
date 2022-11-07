import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

Future<DioError> customOnError(DioError dioError) async {
  if (dioError.type == DioErrorType.connectTimeout) {
    return _customReportError(dioError,
        'La conexión se encuentra muy lenta en este momento, intenta más tarde');
  }

  if (dioError.error is SocketException) {
    return _customReportError(dioError, 'Sin conexión a internet');
  }

  switch (dioError.response?.statusCode ?? 501) {
    case 400:
      return _customReportError(
          dioError, 'Peticion mal hecha, intentalo de nuevo');
    case 401:
      return _customReportError(dioError, 'El token no es válido');
    case 404:
      return _customReportError(dioError, 'No se ha encontrado nada');
    case 500:
      return _customReportError(
          dioError, 'Hay un problema en el servidor de gifs');
    default:
      return dioError;
  }
}

Future<DioError> _customReportError(DioError dioError, respuesta) async {
  dioError.error = respuesta;
  return dioError;
}
