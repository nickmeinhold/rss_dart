import 'package:xml/xml.dart';

extension ElementSelection on XmlElement {
  String select(String name) {
    return findElements(name).firstWhere((_) => true, orElse: () => null)?.text;
  }
}

extension DocumentSelection on XmlDocument {
  String select(String name) {
    return findElements(name).firstWhere((_) => true, orElse: () => null)?.text;
  }
}
