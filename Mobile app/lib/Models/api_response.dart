class api_response<type> {
  type data;
  bool error;
  String error_msg;

  api_response({this.data, this.error = false, this.error_msg = ''});
}
