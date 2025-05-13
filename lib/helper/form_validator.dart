class FormValidators {
  static String? requiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter email';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter phone number';
    }
    if (value.length < 10) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? dateValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter date';
    }
    // Add more date validation logic if needed
    return null;
  }

  static String? timeValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter time';
    }
    // Add more time validation logic if needed
    return null;
  }

  static String? numberValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a number';
    }
    if (double.tryParse(value) == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }
}
