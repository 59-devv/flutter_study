class WriteRequestDto {
  final String? title;
  final String? content;

  WriteRequestDto(this.title, this.content);

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
