plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

import java.io.FileInputStream
import java.util.Properties

fun loadProperties(file: java.io.File): Properties {
    val props = Properties()
    if (file.exists()) {
        FileInputStream(file).use { props.load(it) }
    }
    return props
}

// Clé Google Maps hors git : variable d'env > maps.properties (stable,
// jamais réécrit par Flutter) > local.properties (fallback, réécrit à
// chaque build — ne pas s'en servir comme source principale).
// Voir android/maps.properties.example.
val mapsProps = loadProperties(rootProject.file("maps.properties"))
val localProps = loadProperties(rootProject.file("local.properties"))
val mapsApiKey: String =
    System.getenv("MAPS_API_KEY")
        ?: mapsProps.getProperty("maps.api.key", "")
            .ifEmpty { localProps.getProperty("maps.api.key", "") }

// Échec rapide et explicite plutôt qu'un crash "API key not found" au runtime.
if (mapsApiKey.isEmpty()) {
    throw GradleException(
        "maps.api.key manquant : copiez android/maps.properties.example " +
        "vers android/maps.properties et renseignez votre clé Google Maps."
    )
}

android {
    namespace = "com.example.mobility"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.mobility"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        manifestPlaceholders["MAPS_API_KEY"] = mapsApiKey
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
