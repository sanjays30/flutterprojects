enum Status { NEW, SHIPPED, DELIVERED }

class StatusUtil {
  static String statusToString(Status status) {
    var fullName = status.toString();
    return fullName.substring(fullName.indexOf('.') + 1);
  }

  static Status valueOf(String status) {
    switch (status) {
      case "NEW":
        return Status.NEW;
        break;
      case "SHIPPED":
        return Status.SHIPPED;
        break;
      case "DELIVERED":
        return Status.DELIVERED;
        break;
      default:
        return null;
    }
  }
}
