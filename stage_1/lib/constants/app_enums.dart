import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue("Male")
  male,
  @JsonValue("Female")
  female
}

enum Role {
  @JsonValue("FARMER")
  farmer,
  @JsonValue("COOPERATIVE")
  cooperative,
  @JsonValue("BUSINESS")
  business
}

enum Area {
  @JsonValue("m2")
  m2,
  @JsonValue("hecta")
  hecta
}

enum PH {
  @JsonValue("lessThan7")
  lessThan7,
  @JsonValue("equalTo7")
  equalTo7,
  @JsonValue("moreThan7")
  moreThan7,
}

enum ViewState { idle, busy }

extension GenderExtension on Gender {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case Gender.female:
        return 'Nữ';
      case Gender.male:
        return 'Nam';
      default:
        return 'Khác';
    }
  }
}

extension RoleExtension on Role {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case Role.business:
        return 'Doanh nghiệp';
      case Role.cooperative:
        return 'Hợp tác xã';
      case Role.farmer:
        return 'Nông dân';
      default:
        return 'Khác';
    }
  }
}

extension AreaExtension on Area {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case Area.m2:
        return 'm2';
      case Area.hecta:
        return 'héc-ta';
      default:
        return 'hả?';
    }
  }
}

extension PHExtension on PH {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case PH.lessThan7:
        return '< 7';
      case PH.equalTo7:
        return '= 7';
      case PH.moreThan7:
        return '> 7';
      default:
        return 'hả?';
    }
  }
}

enum AddressLevel { province, district, ward }
enum UnitTime {
  @JsonValue("tháng")
  thang,
  @JsonValue("năm")
  nam,
}

extension UnitTimeExtension on UnitTime {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case UnitTime.thang:
        return 'tháng';
      case UnitTime.nam:
        return 'năm';
      default:
        return 'vô hạn';
    }
  }
}

enum UnitQuantity {
  @JsonValue("cây")
  cay,
  @JsonValue("củ")
  cur,
  @JsonValue("hạt")
  hat,
}

extension UnitQuantityExtension on UnitQuantity {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case UnitQuantity.cay:
        return 'cây';
      case UnitQuantity.cur:
        return 'củ';
      case UnitQuantity.hat:
        return 'hạt';
      default:
        return 'trống';
    }
  }
}

enum HarvestUnit {
  @JsonValue("kg")
  kg,
  @JsonValue("cành")
  canh,
}

extension HarvestUnitExtension on HarvestUnit {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case HarvestUnit.canh:
        return 'cành';
      case HarvestUnit.kg:
        return 'kg';
      default:
        return 'trống';
    }
  }
}