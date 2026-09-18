/// Validateurs de formulaires (Phase 4) : messages en français,
/// formats adaptés à la Côte d'Ivoire.
class Validator {
  static String? validateRequired(String? value, [String? message]) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'Ce champ est requis.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'L\'email est requis.';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Adresse email invalide.';
    }

    return null;
  }

  /// Mot de passe : 6 caractères min. (les règles strictes majuscule +
  /// chiffre + caractère spécial restent dispo via [validateStrongPassword]
  /// pour l'inscription si besoin).
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis.';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères.';
    }
    return null;
  }

  static String? validateStrongPassword(String? value) {
    final basic = validatePassword(value);
    if (basic != null) return basic;
    if (!value!.contains(RegExp(r'[A-Z]'))) {
      return 'Le mot de passe doit contenir au moins une majuscule.';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Le mot de passe doit contenir au moins un chiffre.';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Le mot de passe doit contenir au moins un caractère spécial.';
    }
    return null;
  }

  /// Numéro ivoirien : 8 ou 10 chiffres, espaces acceptés,
  /// préfixe +225 / 00225 optionnel.
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le numéro de téléphone est requis.';
    }

    var digits = value.replaceAll(RegExp(r'[\s\-\.]'), '');
    if (digits.startsWith('+225')) digits = digits.substring(4);
    if (digits.startsWith('00225')) digits = digits.substring(5);
    if (digits.startsWith('+')) return 'Format de numéro invalide.';

    if (!RegExp(r'^\d{8}$|^\d{10}$').hasMatch(digits)) {
      return 'Numéro invalide (8 ou 10 chiffres attendus).';
    }

    return null;
  }

  static String? validateBusNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le numéro du bus est requis.';
    }
    if (int.tryParse(value.trim()) == null) {
      return 'Le numéro du bus doit être un nombre.';
    }
    return null;
  }
}
