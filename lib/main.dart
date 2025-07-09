import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transfer/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const App());
}

// Implementa un módulo de transferencias con las siguientes características:
// 1. Pantalla de Transferencia
// Campos: Número de cuenta destino (TextField), monto (TextField), botón "Transferir"
// Validar que el monto no sea mayor a $5,000 y que la cuenta tenga exactamente 10 dígitos
// Al presionar "Transferir", simula una llamada a un API que tarda 3 segundos
// 2. Simulación del API
// Crea una función que regrese una respuesta Future<bool> después de 3 segundos.
// 70% chance de éxito, 30% de error (usa Random().nextDouble())
// 3. Mostrar Estado de Transferencia
// Muestra un Dialog de éxito o error según la respuesta del "API"
// Deshabilita el botón mientras se procesa la solicitud
// 4. Extra (opcional si queda tiempo)
// Usa flutter_secure_storage para simular guardar un "token de sesión" antes de llamar al API.
// Estructura el código usando una arquitectura limpia (mínimo separando lógica de UI).

//jorge.marrufo@motivus.com
