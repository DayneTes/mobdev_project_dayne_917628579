import 'dart:convert';


HelpRequest helpRequestFromJson(String str) => HelpRequest.fromJson(json.decode(str));

String helpRequestToJson(HelpRequest data) => json.encode(data.toJson());

class HelpRequest {
    String requestedBy;
    String type;

    HelpRequest({
        required this.requestedBy,
        required this.type,
    });

    factory HelpRequest.fromJson(Map<String, dynamic> json) => HelpRequest(
        requestedBy: json["requestedBy"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "requestedBy": requestedBy,
        "type": type,
    };

      @override
  String toString() {
    return 'type: $type, user: $requestedBy ';
  }
}