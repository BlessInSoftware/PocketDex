enum AppPage { home, pokemon, settings }

extension AppPageEx on AppPage {
  String get id {
    return name;
  }

  String get pageName {
    return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';
  }
}
