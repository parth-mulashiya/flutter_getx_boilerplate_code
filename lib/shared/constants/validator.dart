class FormValidator {
  static FormValidator? _instance;

  factory FormValidator() => _instance ??= const FormValidator._();

  const FormValidator._();

  String? validatePhone(String? value) {
    String pattern = r'(^[6-9]{1}[0-9]{9})';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (value.length != 10) {
      return "Phone number must be 10 digits.";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter valid mobile number";
    }
    return null;
  }

  String? validateTextInput(String? value) {
    String pattern = r'(^[A-Za-z\s]+$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Only letters allowed";
    }
    return null;
  }

  String? validateMpin(String? value) {
    String pattern = r'(^[0-9])';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (value.length != 4) {
      return "MPIN must be 4 digits.";
    } else if (!regExp.hasMatch(value)) {
      return "Only number allowed";
    }
    return null;
  }

  String? validatePinCode(String? value) {
    String pattern = r'(^[0-9])';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (value.length != 6) {
      return "PinCode must be 6 digits.";
    } else if (!regExp.hasMatch(value)) {
      return "Only number allowed";
    }
    return null;
  }

  String? validatePassword(String? value) {
//    String pattern = r'(^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{6,20})$)';
//    RegExp regExp = new RegExp(pattern);
    if (value!.isEmpty) {
      return "Password is Required";
    } else if (value.length < 6) {
      return "Password must minimum six characters";
//    } else if (!regExp.hasMatch(value)) {
//      return "one upper, lowercase, number & Special character";
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'(\D)+(\w)*((\.(\w)+)?)+@(\D)+(\w)*((\.(\D)+(\w)*)+)?(\.)[a-z]{2,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validateDOB(String value) {
    // String pattern =
    //     r'/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/';
    String pattern1 =
        r'(^((((0[1-9])|([1-2][0-9])|(3[0-1]))|([1-9]))-(((0[1-9])|(1[0-2]))|([1-9]))-(([0-9]{2})|(((19)|([2]([0]{1})))([0-9]{2}))))$)';
    RegExp regExp = RegExp(pattern1);
    if (value.isEmpty) {
      return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalide Date - Must be DD-MM-YYYY";
    }
    return null;
  }

  String? validateRequired(String? value) {
    if (value!.isEmpty) {
      return "This field is Required";
    }
    return null;
  }

  String? validateDropdownRequired(dynamic value) {
    if (value == null) {
      return "This field is Required";
    }
    return null;
  }

  String? validateRequiredWithMinLength(String? value) {
    if (value!.isEmpty) {
      return "This field is Required";
    }
    return null;
  }

  String? validateBusinessNameInput(String? value) {
    String pattern = r'(^[A-Za-z\s]+$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Only letters allowed";
    }
    return null;
  }

  String? validateFullNameInput(String? value) {
    String pattern = r'(^[A-Za-z\s]+$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Only letters allowed";
    } else if ((value.trim().split(" ")).length != 2) {
      return "Full Name must be two words";
    }
    return null;
  }

  String? validateCardNumber(String? value) {
    String pattern = r'(^[0-9])';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (value.length != 16) {
      return "Card number must be 16 digits.";
    } else if (!regExp.hasMatch(value)) {
      return "Only number allowed";
    }
    return null;
  }

  String? cardExpDate(String? value) {
    // String pattern =
    //     r'/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/';
    // String pattern1 =
    //     r'(^((((0[1-9])|([1-2][0-9])|(3[0-1]))|([1-9]))-(((0[1-9] )|(1[0-2]))|([1-9])))$)';
    String pattern1 = r'(^[0-9]{1,2}(/|-)[0-9]{2}$)';
    RegExp regExp = RegExp(pattern1);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Date must be MM/YY";
    }
    return null;
  }

  String? validateAadhaar(String? value) {
    // String pattern = r'(^[0-9])';
    // RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (value.length != 12) {
      return "Aadhaar number must be 12 digits.";
    }
    return null;
  }

  String? validateIFSC(String? value) {
    String pattern = r'(^[A-Za-z]{4})([0-9]{7})+$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      // return "This field is Required";
    } else if (!regExp.hasMatch(value) || value.length != 11) {
      return "Please Enter Valid IFSC Code";
    }
    return null;
  }

  String? validateIFSCWithRequired(String? value) {
    // String pattern = r'(^[A-Za-z]{4})([0-9]{7})+$';
    // RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (value.length != 11) {
      return "Please Enter Valid IFSC Code";
    }
    return null;
  }

  String? validatePAN(String? value) {
    String pattern = r'(^[A-Za-z]{5}[0-9]{4}[A-Za-z]{1})+$';
    // String pattern = r'(^([A-0,4})([0-9]{0,7}))';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      // return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Please Enter Valid PAN Number";
    }
    return null;
  }

  String? validateGST(String? value) {
    String pattern =
        r'(^[0-9]{2}[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}[0-9]{1}[A-Za-z]{2})+$';
    // String pattern = r'(^([A-0,4})([0-9]{0,7}))';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      // return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Please Enter Valid GST Number";
    }
    return null;
  }

  String? validateAadhaarOTP(String? value) {
    String pattern = r'(^[0-9])';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (value.length != 6) {
      return "MPIN must be 6 digits.";
    } else if (!regExp.hasMatch(value)) {
      return "Only number allowed";
    }
    return null;
  }

  String? validateTransferAmount(String? value) {
    if (value!.isEmpty) {
      return "This field is Required";
    } else if (double.parse(value) < 100 || double.parse(value) > 200000) {
      return "Amount shoud be ₹ 100 to ₹ 2 Lakh";
    }
    return null;
  }

  String? validateCreateWishAmount(String? value) {
    if (value!.isEmpty) {
      return "Amount is Required";
    } else if (double.parse(value) < 999) {
      return "Amount shoud be ₹ 1000 or more ";
    }
    return null;
  }
}
