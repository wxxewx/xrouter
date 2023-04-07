class XRouterConfig {
  final String name;
  final String path;
  final String description;
  final RouterTheme theme;
  final List<ShowCate> showCate;

  const XRouterConfig(this.name, this.path,
      {this.description = '',
      this.theme = RouterTheme.Material,
      this.showCate = const [ShowCate.Page]});
}

enum RouterTheme { Material, Cupertino }

enum ShowCate { Page, Dialog, BottomSheet }
