class ApiResponce<type> {
  type data;
  bool error;
  String error_msg;

  ApiResponce({this.data, this.error = false, this.error_msg = ""});
}
