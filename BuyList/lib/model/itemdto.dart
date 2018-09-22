class ItemDTO {
  String id;
  String itemName;
  String createdBy;
  ItemDTO({this.id, this.itemName, this.createdBy});

  factory ItemDTO.fromJson(String id, Map<String, dynamic> json) {
    return ItemDTO(
      id: id,
      itemName: json['itemName'] as String,
      createdBy: json['createdBy'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    if (id != null) {
      return {'id': id, 'itemName': itemName, 'createdBy': createdBy};
    } else {
      return {'itemName': itemName, 'createdBy': createdBy};
    }
  }
}
