class Env {
  const Env._();
  static const serviceKey = String.fromEnvironment('SERVICE_KEY');
  static bool get isConfigured => serviceKey.isNotEmpty;
}
