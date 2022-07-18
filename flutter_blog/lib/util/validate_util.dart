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

Function validatorTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "제목은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validatorContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "내용을 입력해주세요.";
    } else if (value.length > 500) {
      return "내용 길이를 초과하였습니다..";
    } else {
      return null;
    }
  };
}
