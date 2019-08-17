class Config {
  static final String appTitle = ''; // App Name
  static final String appVersion = ''; // App Version
  static final String username = ''; // username channel target
  static final String botToken = ''; // token of your bot
  static final String baseUrl = 'https://api.telegram.org/bot${botToken}';
  static final String urlChannel = 'tg://resolve?domain=$username';
  static final String idAdmin = '256902271';
  static final String usernameAdmin = 'daffaalam';
  static final DateTime now = DateTime.now();
  static final List<String> navTitle = ['About', 'Send Text', 'Send Photo', 'Report Error'];
}
