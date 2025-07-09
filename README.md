# 💸 Transfer App

**Transfer App** una aplicación Flutter que simula un módulo de transferencias bancarias. Demuestra buenas prácticas como validación de formularios, asincronía, manejo de estado y separación básica de lógica y UI.

## ✨ Funcionalidades

-  Pantalla de transferencia con campos para:
  - Número de cuenta destino (10 dígitos exactos)
  - Monto (máximo permitido: $5,000)
-  Validaciones de entrada para ambos campos
-  Simulación de una llamada API con retardo de 3 segundos
  - 70% probabilidad de éxito
  - 30% probabilidad de error
-  Feedback visual con diálogos de éxito o error
-  Botón "Transferir" deshabilitado mientras se procesa
-  (Opcional) Simulación de almacenamiento de un "token de sesión" usando `flutter_secure_storage`
-  Separación básica entre lógica y presentación (Clean Architecture básica)

## Structura 
lib
│   main.dart
│   
├───data
│       api_service.dart
│       app_secure_storage.dart
│       I_api_service.dart
│       I_secure_storage.dart
│
└───ui
        app.dart
        app_controller.dart

## Cómo correr la app
1. Clona el repositorio
2. Corre `flutter pub get`
3. Lanza la app con `flutter run`

> Nota: se incluye la funcionalidad extra, asegúrate de agregar `flutter_secure_storage` en el `pubspec.yaml`.
 