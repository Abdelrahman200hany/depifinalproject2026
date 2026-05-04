abstract class AppValidation {
  // 🧠 Internal helper — يتحقق من null أو empty
  static String? _checkEmpty(
    String? value, {
    String message = "هذا الحقل مطلوب",
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  // 🟥 Required
  static String? requiredField(
    String? value, {
    String message = "هذا الحقل مطلوب",
  }) {
    return _checkEmpty(value, message: message);
  }

  // 📧 Email
  static String? email(String? value) {
    final emptyCheck = _checkEmpty(value, message: "البريد الإلكتروني مطلوب");
    if (emptyCheck != null) return emptyCheck;

    final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');

    if (!emailRegex.hasMatch(value!.trim())) {
      return "بريد إلكتروني غير صالح";
    }

    return null;
  }

  // 🔒 Password
  static String? password(String? value, {int minLength = 6}) {
    final emptyCheck = _checkEmpty(value, message: "كلمة المرور مطلوبة");
    if (emptyCheck != null) return emptyCheck;

    if (value!.length < minLength) {
      return "كلمة المرور يجب ألا تقل عن $minLength أحرف";
    }

    return null;
  }

  // 📱 Phone (Egyptian example)
  static String? phone(String? value) {
    final emptyCheck = _checkEmpty(value, message: "رقم الهاتف مطلوب");
    if (emptyCheck != null) return emptyCheck;

    final phoneRegex = RegExp(r'^01[0-9]{9}$');

    if (!phoneRegex.hasMatch(value!.trim())) {
      return "رقم هاتف غير صحيح";
    }

    return null;
  }

  // 🧑 Name
  static String? name(String? value, {int minLength = 2}) {
    final emptyCheck = _checkEmpty(value, message: "الاسم مطلوب");
    if (emptyCheck != null) return emptyCheck;

    if (value!.trim().length < minLength) {
      return "الاسم قصير جدًا";
    }

    return null;
  }

  // 🔢 Numeric Only
  static String? numeric(String? value) {
    final emptyCheck = _checkEmpty(value, message: "هذا الحقل مطلوب");
    if (emptyCheck != null) return emptyCheck;

    if (double.tryParse(value!) == null) {
      return "يجب إدخال أرقام فقط";
    }

    return null;
  }

  // 🔠 Min Length
  static String? minLength(String? value, int length) {
    final emptyCheck = _checkEmpty(value, message: "هذا الحقل مطلوب");
    if (emptyCheck != null) return emptyCheck;

    if (value!.length < length) {
      return "يجب ألا يقل عن $length أحرف";
    }

    return null;
  }

  // 🔡 Max Length
  static String? maxLength(String? value, int length) {
    final emptyCheck = _checkEmpty(value, message: "هذا الحقل مطلوب");
    if (emptyCheck != null) return emptyCheck;

    if (value!.length > length) {
      return "يجب ألا يزيد عن $length أحرف";
    }

    return null;
  }

  // 🔐 Confirm Password
  static String? confirmPassword(String? value, String originalPassword) {
    final emptyCheck = _checkEmpty(value, message: "تأكيد كلمة المرور مطلوب");
    if (emptyCheck != null) return emptyCheck;

    if (value != originalPassword) {
      return "كلمتا المرور غير متطابقتين";
    }

    return null;
  }

  // 🔤 Username (letters + numbers)
  static String? username(String? value) {
    final emptyCheck = _checkEmpty(value, message: "اسم المستخدم مطلوب");
    if (emptyCheck != null) return emptyCheck;

    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');

    if (!usernameRegex.hasMatch(value!)) {
      return "اسم المستخدم غير صالح";
    }

    return null;
  }

  // 📍 Governorate (Dropdown)
  static String? governorate(String? value) {
    return _checkEmpty(value, message: "يجب اختيار المحافظة");
  }

  // 📍 Address
  static String? address(String? value) {
    final emptyCheck = _checkEmpty(value, message: "العنوان مطلوب");
    if (emptyCheck != null) return emptyCheck;

    if (value!.trim().length < 5) {
      return "العنوان قصير جدًا";
    }
    return null;
  }

  // 📍 Mark / Landmark
  static String? mark(String? value) {
    return _checkEmpty(value, message: "يجب إدخال علامة مميزة");
  }

  // 📦 Parcel Name
  static String? parcelName(String? value) {
    final emptyCheck = _checkEmpty(value, message: "اسم الطرد مطلوب");
    if (emptyCheck != null) return emptyCheck;

    if (value!.length < 2) {
      return "اسم الطرد قصير جدًا";
    }
    return null;
  }

  // 📦 Parcel Type (Dropdown)
  static String? parcelType(String? value) {
    return _checkEmpty(value, message: "يجب اختيار نوع الطرد");
  }

  // 📝 Description (long text)
  static String? description(String? value) {
    final emptyCheck = _checkEmpty(value, message: "الوصف مطلوب");
    if (emptyCheck != null) return emptyCheck;

    if (value!.length < 10) {
      return "الوصف يجب أن يكون أوضح (10 أحرف على الأقل)";
    }
    return null;
  }

  // 📝 Additional Notes (optional)
  static String? optionalNotes(String? value) {
    return null; // optional field
  }

  // 🖼 Image (optional but if exist validate)
  static String? image(dynamic file) {
    if (file == null) return null;

    // لو عندك File object تقدر توسعها بعدين
    return null;
  }

  // 💰 Price
  static String? price(String? value) {
    final emptyCheck = _checkEmpty(value, message: "السعر مطلوب");
    if (emptyCheck != null) return emptyCheck;

    final number = double.tryParse(value!);
    if (number == null || number <= 0) {
      return "سعر غير صالح";
    }

    return null;
  }

  // 🚚 Delivery Price
  static String? deliveryPrice(String? value) {
    final emptyCheck = _checkEmpty(value, message: "سعر التوصيل مطلوب");
    if (emptyCheck != null) return emptyCheck;

    final number = double.tryParse(value!);
    if (number == null || number < 0) {
      return "سعر التوصيل غير صالح";
    }

    return null;
  }

  // 📅 Date validation
  static String? date(String? value, {String message = "التاريخ مطلوب"}) {
    return _checkEmpty(value, message: message);
  }

  // ⏰ Time validation
  static String? time(String? value, {String message = "الوقت مطلوب"}) {
    return _checkEmpty(value, message: message);
  }
}
