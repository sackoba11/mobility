import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppString {
  // Token Mapbox lu depuis .env (voir .env.example). Vide si absent :
  // les itinéraires sont alors indisponibles au lieu de crasher.
  static String get pkkeyMapBox => dotenv.isInitialized
      ? (dotenv.maybeGet('MAPBOX_PUBLIC_TOKEN') ?? '')
      : '';

  static bool get hasMapboxToken => pkkeyMapBox.isNotEmpty;

  // text
  static String hey = "Hey 👋";
  static String descriptionService =
      "Cliquer sur Passager pour demander un service ou sur Conducteur pour offrir un service.";

  // Home Texts
  static String welcome = "Welcome back!";
  static String loginWithGoogle = "Login with google";

  // Services Texts
  static String logout = "Logout";
  static String passenger = "Passager";
  static String searchService = "Rechercher un service";
  static String driverBus = "Conducteur Bus";
  static String activateService = "Activer un service ";

  // UserPage and DriverPage Texts
  static String starttracking = "Commencer";
  static String startDriving = "Commencer";
  static String chooseCurrentLocation = "Choisir ma position actuelle";
  static String destination = "Destination";
  static String start = "Départ";
  static String canceltracking = "Cancel tracking";
  static String canceldriving = "Cancel driving";
  static String typeofcar = "Type of car";
  static String colorCar = "Color";
  static String matriculationCar = "Matriculation";

  // profile page texts
  static String name = "Name :";
  static String nameValue = "Name Value";
  static String email = "Email :";
  static String emailValue = "Email Value";
  static String createdat = "Created at :";
  static String createdatValue = "Created at Value";
  static String anytrouble = "Any trouble ? let’s us know";
  static String areyousure = "Are you sure ?";
  static String yes = "Yes";
  static String doyouwanttodisconnect = "Do you want to disconnect ?";
}
