class Env {
  Env(this.baseUrl);

  final String baseUrl;
}

mixin EnvValue {
  static final Env development = Env('http://demo1590445.mockable.io');
  static final Env production = Env('http://demo1590445.mockable.io');
}