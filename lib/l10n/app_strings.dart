class AppStrings {

  static Map<String, Map<String, String>> strings = {

    "en": {

      "home_title": "Healthy Harvest Starts Here",

      "detect_disease": "Detect Disease",

      "scan": "Scan Disease",

      "upload": "Upload Image",

      "predict": "Predict Disease",

      "profile": "Profile",

      "notification": "Notifications",

      "login": "Login",

      "signup": "Sign Up",

      "logout": "Logout",

      "help": "Help",

      "select_language": "Select Language",

      "home": "Home",

      "name": "Name",

      "email": "Email",

      "phone": "Phone",

      "change_password": "Change Password",

      "manage_preferences": "Manage Preferences",

      "camera": "Camera",

      "gallery": "Gallery",

      "predict_disease": "Predict Disease",

      "select_image": "Please select image",

      "late_blight": "Late Blight Detected",

      // Missing translation keys for notifications
      "update_available": "Update Available",
      "update_message": "A new version of the app is available",
      "disease_not_detected": "Disease Not Detected",
      "healthy_message": "Your tomato plants are healthy!",
      "disease_identified": "Disease Identified",
      "late_blight_message": "Late blight detected in your tomato plants",
      "weekly_report": "Weekly Report",
      "report_message": "Your weekly disease detection summary is ready",
      "yesterday": "Yesterday",

    },

    "ml": {

      "home_title": "ആരോഗ്യകരമായ വിളവെടുപ്പ് ഇവിടെ തുടങ്ങുന്നു",

      "detect_disease": "രോഗം കണ്ടെത്തുക",

      "scan": "സ്കാൻ ചെയ്യുക",

      "upload": "ചിത്രം അപ്ലോഡ് ചെയ്യുക",

      "predict": "രോഗം പ്രവചിക്കുക",

      "profile": "പ്രൊഫൈൽ",

      "notification": "നോട്ടിഫിക്കേഷനുകൾ",

      "login": "ലോഗിൻ",

      "signup": "സൈൻ അപ്പ്",

      "logout": "ലോഗ്ഔട്ട്",

      "help": "സഹായം",

      "select_language": "ഭാഷ തിരഞ്ഞെടുക്കുക",

      "home": "ഹോം",
      "name": "പേര്",
      "email": "ഇമെയിൽ",
      "phone": "ഫോൺ",
      "change_password": "പാസ്‌വേഡ് മാറ്റുക",
      "manage_preferences": "ക്രമീകരണങ്ങൾ",
      "camera": "ക്യാമറ",
      "gallery": "ഗാലറി",
      "predict_disease": "രോഗം പ്രവചിക്കുക",
      "select_image": "ചിത്രം തിരഞ്ഞെടുക്കുക",
      "late_blight": "ലേറ്റ് ബ്ലൈറ്റ് കണ്ടെത്തി",

      // Missing translation keys for notifications
      "update_available": "അപ്ഡേറ്റ് ലഭ്യമാണ്",
      "update_message": "ആപ്പിന്റെ പുതിയ പതിപ്പ് ലഭ്യമാണ്",
      "disease_not_detected": "രോഗം കണ്ടെത്തിയില്ല",
      "healthy_message": "നിങ്ങളുടെ തക്കാളി ചെടികൾ ആരോഗ്യകരമാണ്!",
      "disease_identified": "രോഗം കണ്ടെത്തി",
      "late_blight_message": "നിങ്ങളുടെ തക്കാളി ചെടികളിൽ ലേറ്റ് ബ്ലൈറ്റ് കണ്ടെത്തി",
      "weekly_report": "ആഴ്ചത്തെ റിപ്പോർട്ട്",
      "report_message": "നിങ്ങളുടെ ആഴ്ചത്തെ രോഗം കണ്ടെത്തൽ സംഗ്രഹം തയ്യാറായി",
      "yesterday": "ഇന്നലെ",

    }

  };

  static String text(String key, String lang) {

    return strings[lang]?[key] ?? key;

  }

}