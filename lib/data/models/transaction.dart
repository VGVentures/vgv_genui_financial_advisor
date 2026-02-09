/// Primary transaction category, based on Plaid's taxonomy.
enum TransactionCategory {
  /// Restaurants, coffee shops, bars, food delivery.
  foodAndDrink,

  /// Airlines, hotels, car rentals, rideshare.
  travel,

  /// Retail, clothing, electronics.
  shopping,

  /// Movies, music, games, events.
  entertainment,

  /// Rent, mortgage, utilities, internet, phone.
  rentAndUtilities,

  /// Account transfers, wire transfers, Venmo/Zelle.
  transfer,

  /// Student loan, auto loan, mortgage payments.
  loanPayments,

  /// Paychecks, direct deposits, interest earned.
  income,

  /// General retail purchases (Target, Walmart, Amazon).
  generalMerchandise,

  /// Gas, parking, tolls, public transit.
  transportation,

  /// Haircuts, spa, cosmetics.
  personalCare,

  /// Doctor visits, pharmacy, medical bills.
  healthcare,

  /// Tuition, books, courses.
  education,

  /// Overdraft fees, maintenance fees, ATM fees.
  bankFees,

  /// Taxes, donations, government services.
  governmentAndNonProfit,
}

/// How the transaction was initiated.
enum PaymentChannel {
  /// Online or app-based purchase.
  online,

  /// In-store / point-of-sale purchase.
  inStore,

  /// ACH, direct deposit, or other.
  other,
}

/// Represents a single financial transaction.
class Transaction {
  /// Creates a [Transaction] instance.
  const Transaction({
    required this.id,
    required this.accountId,
    required this.amount,
    required this.date,
    required this.name,
    required this.category,
    required this.paymentChannel,
    this.merchantName,
    this.pending = false,
  });

  /// Unique transaction identifier.
  final String id;

  /// The account this transaction belongs to.
  final String accountId;

  /// Transaction amount.
  ///
  /// Positive values represent money leaving the account (purchases, payments).
  /// Negative values represent money entering the account (income, refunds).
  /// This follows Plaid's sign convention.
  final double amount;

  /// Date the transaction occurred.
  final DateTime date;

  /// Merchant name, when available. Null for transfers, ATM, etc.
  final String? merchantName;

  /// Transaction description / display name.
  final String name;

  /// Primary spending category.
  final TransactionCategory category;

  /// Whether this transaction is still pending.
  final bool pending;

  /// How the payment was made.
  final PaymentChannel paymentChannel;
}
