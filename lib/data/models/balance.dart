/// ISO 4217 currency codes.
enum CurrencyCode {
  /// United States Dollar.
  usd,

  /// Euro.
  eur,

  /// British Pound Sterling.
  gbp,
}

/// Represents the balance information for a financial account.
class Balance {
  /// Creates a [Balance] instance.
  const Balance({
    required this.current,
    required this.currencyCode,
    this.available,
    this.limit,
  });

  /// The total amount of funds in the account, or total amount owed
  /// for credit/loan accounts.
  final double current;

  /// The amount of funds available for spending or withdrawal.
  /// For depository accounts: current minus pending debits.
  /// Null for credit/loan accounts.
  final double? available;

  /// The credit limit. Only applicable to credit accounts.
  final double? limit;

  /// ISO 4217 currency code.
  final CurrencyCode currencyCode;
}
