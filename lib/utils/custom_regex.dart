mixin CustomRejax {
  mobileNumber(value) {
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      throw ArgumentError('Invalid mobile number');
    }
  }

  otp4(value) {
    if (!RegExp(r'^\d{4}$').hasMatch(value)) {
      return ArgumentError('Invalid OTP');
    }
  }
}
