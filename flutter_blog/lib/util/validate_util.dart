import 'package:validators/validators.dart';

Function validatorUsername() {
  return (String? value) {
    if (value!.isEmpty) {
      return "유저네임을 입력해주세요.";
    } else if (!isAlphanumeric(value)) {
      return "유저네임은 영문과 숫자만 입력할 수 있습니다.";
    } else if (value.length > 10) {
      return "유저네임을 10자 이내로 입력해주세요.";
    } else if (value.length < 4) {
      return "유저네임을 4자 이상 입력해주세요.";
    } else {
      return null;
    }
  };
}

Function validatorPassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "비밀번호를 입력해주세요.";
    } else if (value.length > 10) {
      return "비밀번호를 10자 이내로 입력해주세요.";
    } else if (value.length < 4) {
      return "비밀번호를 4자 이상 입력해주세요.";
    } else {
      return null;
    }
  };
}

Function validatorEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일을 입력해주세요.";
    } else if (!isEmail(value)) {
      return "이메일 형식을 확인해주세요.";
    } else {
      return null;
    }
  };
}
