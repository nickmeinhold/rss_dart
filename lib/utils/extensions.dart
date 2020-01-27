import 'package:xml/xml.dart';

extension DocumentGetText on XmlDocument {
  String getTextFor(String name) {
    return findElements(name).firstWhere((_) => true, orElse: () => null)?.text;
  }
}

extension ElementGetText on XmlElement {
  String getTextFor(String name) {
    return findElements(name).firstWhere((_) => true, orElse: () => null)?.text;
  }
}

extension ElementGetElement on XmlElement {
  XmlElement getElementFor(String name) {
    return findElements(name).firstWhere((_) => true, orElse: () => null);
  }
}
