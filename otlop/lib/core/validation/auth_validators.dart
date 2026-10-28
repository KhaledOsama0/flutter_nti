
class AppValidators {

  // Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  // Password Validation
  
static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least 1 uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least 1 lowercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least 1 number';
  }

  if (!RegExp(r'[^a-zA-Z0-9\s]').hasMatch(value)) {
    return 'Password must contain at least 1 special character';
  }

  return null;
}


  // Name Validation
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    if (value.trim().length > 50) {
      return 'Name must not exceed 50 characters';
    }

    if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'Name must not contain numbers';
    }

    return null;
  }

  // Phone Validation 
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final phone = value.trim();

    final phoneRegex = RegExp(
      r'^(?:\+20|0020|0)?1[0125][0-9]{8}$',
    );

    if (!phoneRegex.hasMatch(phone)) {
      return 'Please enter a valid Egyptian phone number';
    }

    return null;
  }
}
