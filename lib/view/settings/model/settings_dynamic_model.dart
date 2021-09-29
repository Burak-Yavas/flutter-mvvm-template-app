class SettingsDynamicModel {
  final String? url;
  final String title;

  SettingsDynamicModel(this.title, {this.url});

  factory SettingsDynamicModel.fakeArchitecturePR() {
    return SettingsDynamicModel('Project Contributors',
        url:
            'https://github.com/Burak-Yavas/flutter-mvvm-template-app/pulls?q=is%3Apr+is%3Aclosed');
  }

  factory SettingsDynamicModel.fakeNull() {
    return SettingsDynamicModel(
      'Project Contributors',
    );
  }
}
