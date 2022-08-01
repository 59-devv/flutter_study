class UpdateRequestDto {
  final String? title;
  final String? content;

  UpdateRequestDto(this.title, this.content);

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
