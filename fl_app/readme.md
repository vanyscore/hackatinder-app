# fl_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Генерация /build/web (веб проекта). (отгружается веб сервером в браузер)
### https://docs.flutter.dev/deployment/web
```shell
flutter build web
flutter build web --web-renderer html
flutter build web --web-renderer canvaskit
```

### Запуск проекта локально. Средствами flutter.
```shell
flutter run -d chrome --web-renderer html
flutter run -d chrome --web-renderer canvaskit
```
