import '../entities/ai_provider.dart';

/// Cost Optimizer - selects the best provider for translation tasks.
enum OptimizationStrategy { cheapest, fastest, highestQuality, balanced }

class CostOptimizer {
  CostOptimizer._();

  /// Select the best provider based on strategy.
  static AiProvider? selectProvider({
    required List<AiProvider> providers,
    required OptimizationStrategy strategy,
    int textLength = 0,
  }) {
    if (providers.isEmpty) return null;
    if (providers.length == 1) return providers.first;

    switch (strategy) {
      case OptimizationStrategy.cheapest:
        return _selectCheapest(providers);
      case OptimizationStrategy.fastest:
        return _selectFastest(providers);
      case OptimizationStrategy.highestQuality:
        return _selectHighestQuality(providers);
      case OptimizationStrategy.balanced:
        return _selectBalanced(providers);
    }
  }

  static AiProvider _selectCheapest(List<AiProvider> providers) {
    // Prefer local models, then cheapest cloud providers
    final local = providers.where((p) =>
        p.type == ProviderType.ollama || p.type == ProviderType.lmStudio);
    if (local.isNotEmpty) return local.first;

    // DeepSeek is cheapest, then Gemini, then others
    final order = [ProviderType.deepseek, ProviderType.gemini, ProviderType.openai, ProviderType.claude];
    for (final type in order) {
      final match = providers.where((p) => p.type == type);
      if (match.isNotEmpty) return match.first;
    }
    return providers.first;
  }

  static AiProvider _selectFastest(List<AiProvider> providers) {
    // Gemini Flash and DeepSeek are fastest
    final fast = providers.where((p) =>
        p.type == ProviderType.gemini || p.type == ProviderType.deepseek);
    if (fast.isNotEmpty) return fast.first;
    return providers.first;
  }

  static AiProvider _selectHighestQuality(List<AiProvider> providers) {
    // Claude and GPT-4o are highest quality
    final high = providers.where((p) =>
        p.type == ProviderType.claude || p.selectedModel.contains('4o'));
    if (high.isNotEmpty) return high.first;
    return providers.first;
  }

  static AiProvider _selectBalanced(List<AiProvider> providers) {
    // Good quality at reasonable cost
    final balanced = providers.where((p) =>
        p.selectedModel.contains('mini') ||
        p.selectedModel.contains('flash') ||
        p.selectedModel.contains('sonnet'));
    if (balanced.isNotEmpty) return balanced.first;
    return _selectCheapest(providers);
  }

  /// Estimate cost for a translation task.
  static double estimateCost({
    required AiProvider provider,
    required int characterCount,
    double tokensPerChar = 1.3,
  }) {
    final estimatedTokens = (characterCount * tokensPerChar).round();
    final inputCost = _getInputCostPer1k(provider.type);
    final outputCost = _getOutputCostPer1k(provider.type);
    return (estimatedTokens / 1000) * inputCost + (estimatedTokens / 1000) * outputCost;
  }

  static double _getInputCostPer1k(ProviderType type) {
    switch (type) {
      case ProviderType.openai: return 0.0025;
      case ProviderType.gemini: return 0.000125;
      case ProviderType.deepseek: return 0.00014;
      case ProviderType.claude: return 0.003;
      case ProviderType.ollama:
      case ProviderType.lmStudio: return 0.0; // Local
      default: return 0.002;
    }
  }

  static double _getOutputCostPer1k(ProviderType type) {
    switch (type) {
      case ProviderType.openai: return 0.01;
      case ProviderType.gemini: return 0.0005;
      case ProviderType.deepseek: return 0.00028;
      case ProviderType.claude: return 0.015;
      case ProviderType.ollama:
      case ProviderType.lmStudio: return 0.0;
      default: return 0.006;
    }
  }
}
