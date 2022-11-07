import 'package:get/get.dart';

class AppValidator {
  static bool isImage(String url) {
    if (url.contains('.apng') || url.contains('.avif') ||
        url.contains('.gif') || url.contains('.jpg') ||
        url.contains('.jpeg') || url.contains('.jfif')||
        url.contains('.pjpeg') || url.contains('.pjp') ||
        url.contains('.png') || url.contains('.svg') ||
        url.contains('.webp') || url.contains('.jfif')) {
      return true;
    } else {
      return false;
    }
  }

  static String? isValidReport(String? value) {
    if (value!.isNotEmpty) {
      if (value.length <= 10) {
        return 'برجاء كتابة التقرير كاملا'.tr;
      }
    } else {
      return 'برجاء املاء الحقل'.tr;
    }

    return null;
  }

  static String? nameAddress(String? value) {
    if (value!.isNotEmpty) {
      if (value.length <= 5) {
        return 'برجاء كتابة الاسم كامل'.tr;
      }
    } else {
      return 'برجاء املاء الحقل'.tr;
    }

    return null;
  }

  static String? detailsAddress(String? value) {
    if (value!.isNotEmpty) {
      if (value.length <= 5) {
        return 'برجاء كتابة التفاصيل كاملة كامل'.tr;
      }
    } else {
      return 'برجاء املاء الحقل'.tr;
    }

    return null;
  }


  static String? isValidphone(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'برجاء املاء الحقل'.tr;
      } else if (value.length < 9) {
        return 'من فضلك ادخل رقم صحيح'.tr;
      }
    }
    return null;
  }


  static String? isValidEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'برجاء املاء الحقل'.tr;
      } else if (!value.contains('@') || !value.contains('.')) {
        return 'من فضلك ادخل اميل صحيح'.tr;
      }
    }
    return null;
  }

  static String? isValidName(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'برجاء املاء الحقل'.tr;
      } else if (value.length < 4) {
        return 'من فضلك اسمك كاملا'.tr;
      }
    }
    return null;
  }

  static String? isValidEmpty(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'برجاء املاء الحقل'.tr;
      }
    }
    return null;
  }

  static String? isValidPassword(String? value) {
    if (value != null) {
      if (value.isEmpty || value.length < 4) {
        return 'برجاء املاء الحقل'.tr;
      }
    }
    return null;
  }

  static String? isNotLowerThan5(String? value) {
    if (value != null) {
      if (value.isEmpty && value.length < 4) {
        return 'برجاء املاء الحقل'.tr;
      }
    }
    return null;
  }

  static String? isValidLocation(String? value) {
    if (value != null) {
      if (value.isEmpty || value.length < 15) {
        return 'برجاء ادخال العنوان كامل';
      }
    }
    return null;
  }

}