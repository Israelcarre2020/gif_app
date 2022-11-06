import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

Future<DioError> customOnError(DioError dioError) async {
  if (dioError.type == DioErrorType.connectTimeout) {
    return _customReportError(dioError,
        'En estos momentos estamos trabajando en cambios, intenta volver a recargar los datos');
  }

  if (dioError.error is SocketException) {
    return _customReportError(dioError, 'Sin conexión a internet');
  }

  switch (dioError.response?.statusCode ?? 501) {
    case 400:
      return _customReportError(
          dioError, 'Peticion mal hecha, intentalo de nuevo');
    case 401:
      return _customReportError(dioError, 'No tienes permiso');
    case 404:
      return _customReportError(dioError, 'No se ha encontrado nada');
    case 500:
      return _customReportError(dioError, 'Tuvimos un error en el servidor');
    default:
      return dioError;
  }
}

Future<DioError> _customReportError(DioError dioError, respuesta) async {
  dioError.error = respuesta;
  return dioError;
}
