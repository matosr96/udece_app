
# UDECE App – Flutter Login & Home Flow

Este proyecto es una aplicación Flutter básica que incluye:

- Pantalla de login funcional
- Autenticación usando una API externa
- Gestión del estado global con **Riverpod**
- Almacenamiento local con **Shared Preferences**
- Navegación hacia una pantalla de inicio (`HomeScreen`)
- Formulario centralizado y notificaciones visuales

---

## 📦 Tecnologías utilizadas

- [Flutter](https://flutter.dev/)
- [Riverpod](https://riverpod.dev/) – manejo de estado reactivo
- [Dio](https://pub.dev/packages/dio) – cliente HTTP para consumir la API
- [Shared Preferences](https://pub.dev/packages/shared_preferences) – persistencia local simple

---

## 🚀 Estructura del proyecto

```bash
lib/
├── main.dart                       # Punto de entrada
└── src/
    ├── data/
    │   └── services/              # Lógica para llamar a la API (UserService)
    ├── presentation/
    │   ├── providers/             # Provider de autenticación (Riverpod)
    │   └── screens/               # LoginScreen y HomeScreen
    └── utils/
        └── http_client.dart       # Cliente Dio centralizado
```

---

## ⚙️ Configuración inicial

1. Clona el repositorio
2. Ejecuta `flutter pub get`
3. Asegúrate de tener tu backend corriendo en `http://localhost:8000/api`
4. Si estás usando un emulador de Android, edita `ApiConstants` para usar `10.0.2.2`

---

## 🧪 Funcionalidad actual

### Login
- Solicita correo y contraseña
- Llama al endpoint `POST /signin`
- Si es exitoso, guarda el usuario localmente y navega a `HomeScreen`

### HomeScreen
- Muestra un formulario simple
- Permite ingresar datos (ej. nombre)
- Incluye un `Drawer` con la opción de cerrar sesión
- Usa `AlertDialog` para mostrar feedback visual

---

## 🔐 Persistencia

- El correo del usuario se guarda en `SharedPreferences` para mantener la sesión

---

## 🧑‍💻 Autor

Desarrollado por GCA INGECOR — Proyecto UDECE Flutter
