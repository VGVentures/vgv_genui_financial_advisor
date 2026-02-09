import 'package:finance_app/data/models/models.dart';

/// Bundles accounts and transactions for a single mock persona.
class MockScenario {
  /// Creates a [MockScenario] instance.
  const MockScenario({
    required this.name,
    required this.description,
    required this.accounts,
    required this.transactions,
  });

  /// Human-readable scenario name (e.g. "Young & Responsible").
  final String name;
  
  /// Brief description of the persona.
  final String description;

  /// All accounts belonging to this persona.
  final List<Account> accounts;

  /// All transactions across all accounts for this persona.
  final List<Transaction> transactions;
}
