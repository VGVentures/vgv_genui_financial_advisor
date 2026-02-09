import 'package:finance_app/data/mock/mock_scenario.dart';
import 'package:finance_app/data/models/models.dart';

/// Mock scenario for a disciplined, budget-conscious young professional.
final youngResponsibleScenario = MockScenario(
  name: 'Young & Responsible',
  description: 'Alex, 23 — junior software developer. Disciplined saver who '
      'pays credit card in full monthly, cooks at home mostly, and lives a '
      'modest lifestyle. Biweekly paycheck with automatic savings transfers.',
  accounts: [_checking, _savings, _credit],
  transactions: _transactions,
);

/// Accounts

const _checking = Account(
  id: 'acc_yr_checking',
  name: 'First National Checking',
  type: AccountType.depository,
  subtype: AccountSubtype.checking,
  mask: '4523',
  balance: Balance(
    current: 2850.43,
    available: 2803.60,
    currencyCode: CurrencyCode.usd,
  ),
);

const _savings = Account(
  id: 'acc_yr_savings',
  name: 'Summit High-Yield Savings',
  type: AccountType.depository,
  subtype: AccountSubtype.savings,
  mask: '7891',
  balance: Balance(
    current: 8420,
    available: 8420,
    currencyCode: CurrencyCode.usd,
  ),
);

const _credit = Account(
  id: 'acc_yr_credit',
  name: 'Horizon Student Card',
  type: AccountType.credit,
  subtype: AccountSubtype.creditCard,
  mask: '3344',
  balance: Balance(
    current: 15.98,
    limit: 3000,
    currencyCode: CurrencyCode.usd,
  ),
);

// ---------------------------------------------------------------------------
// Transactions — Dec 1 2025 -> Feb 5 2026
// ---------------------------------------------------------------------------

final _transactions = <Transaction>[
  // ── December 2025 ───────────────────────────────────────────────────

  // Dec 1 — Paycheck
  Transaction(
    id: 'txn_yr_001',
    accountId: 'acc_yr_checking',
    amount: -2650,
    date: DateTime(2025, 12),
    name: 'ACME CORP PAYROLL',
    merchantName: 'ACME CORP',
    category: TransactionCategory.income,
    paymentChannel: PaymentChannel.other,
  ),

  // Dec 1 — Rent
  Transaction(
    id: 'txn_yr_002',
    accountId: 'acc_yr_checking',
    amount: 1100,
    date: DateTime(2025, 12),
    name: 'Bank Transfer - Rent',
    category: TransactionCategory.rentAndUtilities,
    paymentChannel: PaymentChannel.other,
  ),

  // Dec 2 — Savings transfer (checking side)
  Transaction(
    id: 'txn_yr_003',
    accountId: 'acc_yr_checking',
    amount: 500,
    date: DateTime(2025, 12, 2),
    name: 'Transfer to Summit Savings',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Dec 2 — Savings transfer (savings side)
  Transaction(
    id: 'txn_yr_004',
    accountId: 'acc_yr_savings',
    amount: -500,
    date: DateTime(2025, 12, 2),
    name: 'Transfer from First National',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Dec 3 — Groceries
  Transaction(
    id: 'txn_yr_005',
    accountId: 'acc_yr_checking',
    amount: 52.37,
    date: DateTime(2025, 12, 3),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 4 — YouTube Premium (credit card)
  Transaction(
    id: 'txn_yr_006',
    accountId: 'acc_yr_credit',
    amount: 13.99,
    date: DateTime(2025, 12, 4),
    name: 'YouTube Premium',
    merchantName: 'Google',
    category: TransactionCategory.entertainment,
    paymentChannel: PaymentChannel.online,
  ),

  // Dec 4 — Google One (credit card)
  Transaction(
    id: 'txn_yr_007',
    accountId: 'acc_yr_credit',
    amount: 1.99,
    date: DateTime(2025, 12, 4),
    name: 'Google One Storage',
    merchantName: 'Google',
    category: TransactionCategory.shopping,
    paymentChannel: PaymentChannel.online,
  ),

  // Dec 5 — Planet Fitness
  Transaction(
    id: 'txn_yr_008',
    accountId: 'acc_yr_checking',
    amount: 29.99,
    date: DateTime(2025, 12, 5),
    name: 'FitLife Gym Monthly',
    merchantName: 'FitLife Gym',
    category: TransactionCategory.personalCare,
    paymentChannel: PaymentChannel.online,
  ),

  // Dec 6 — Coffee
  Transaction(
    id: 'txn_yr_009',
    accountId: 'acc_yr_checking',
    amount: 5.50,
    date: DateTime(2025, 12, 6),
    name: 'Morning Brew Coffee',
    merchantName: 'Morning Brew Coffee',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 7 — Gas
  Transaction(
    id: 'txn_yr_010',
    accountId: 'acc_yr_checking',
    amount: 42.18,
    date: DateTime(2025, 12, 7),
    name: 'QuickFuel #13847',
    merchantName: 'QuickFuel',
    category: TransactionCategory.transportation,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 8 — Chipotle
  Transaction(
    id: 'txn_yr_011',
    accountId: 'acc_yr_checking',
    amount: 13.45,
    date: DateTime(2025, 12, 8),
    name: 'Burrito Bowl Co',
    merchantName: 'Burrito Bowl',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 10 — Car Insurance
  Transaction(
    id: 'txn_yr_012',
    accountId: 'acc_yr_checking',
    amount: 95,
    date: DateTime(2025, 12, 10),
    name: 'SafeRide Auto Insurance',
    merchantName: 'SafeRide Auto Insurance',
    category: TransactionCategory.rentAndUtilities,
    paymentChannel: PaymentChannel.online,
  ),

  // Dec 10 — Google Fi
  Transaction(
    id: 'txn_yr_013',
    accountId: 'acc_yr_checking',
    amount: 35,
    date: DateTime(2025, 12, 10),
    name: 'Google Fi Wireless',
    merchantName: 'Google Fi',
    category: TransactionCategory.rentAndUtilities,
    paymentChannel: PaymentChannel.online,
  ),

  // Dec 11 — Groceries
  Transaction(
    id: 'txn_yr_014',
    accountId: 'acc_yr_checking',
    amount: 38.14,
    date: DateTime(2025, 12, 11),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 13 — Coffee
  Transaction(
    id: 'txn_yr_015',
    accountId: 'acc_yr_checking',
    amount: 5.50,
    date: DateTime(2025, 12, 13),
    name: 'Morning Brew Coffee',
    merchantName: 'Morning Brew Coffee',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 14 — Movie
  Transaction(
    id: 'txn_yr_016',
    accountId: 'acc_yr_checking',
    amount: 16,
    date: DateTime(2025, 12, 14),
    name: 'Cinema Palace',
    merchantName: 'Cinema Palace',
    category: TransactionCategory.entertainment,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 15 — Paycheck
  Transaction(
    id: 'txn_yr_017',
    accountId: 'acc_yr_checking',
    amount: -2650,
    date: DateTime(2025, 12, 15),
    name: 'ACME CORP PAYROLL',
    merchantName: 'ACME CORP',
    category: TransactionCategory.income,
    paymentChannel: PaymentChannel.other,
  ),

  // Dec 16 — Savings transfer (checking side)
  Transaction(
    id: 'txn_yr_018',
    accountId: 'acc_yr_checking',
    amount: 500,
    date: DateTime(2025, 12, 16),
    name: 'Transfer to Summit Savings',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Dec 16 — Savings transfer (savings side)
  Transaction(
    id: 'txn_yr_019',
    accountId: 'acc_yr_savings',
    amount: -500,
    date: DateTime(2025, 12, 16),
    name: 'Transfer from First National',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Dec 17 — Groceries
  Transaction(
    id: 'txn_yr_020',
    accountId: 'acc_yr_checking',
    amount: 61.23,
    date: DateTime(2025, 12, 17),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 18 — Food
  Transaction(
    id: 'txn_yr_021',
    accountId: 'acc_yr_checking',
    amount: 14.72,
    date: DateTime(2025, 12, 18),
    name: 'Burrito Bowl Co',
    merchantName: 'Burrito Bowl',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 19 — Google Store (credit card)
  Transaction(
    id: 'txn_yr_022',
    accountId: 'acc_yr_credit',
    amount: 27.49,
    date: DateTime(2025, 12, 19),
    name: 'Google Store',
    merchantName: 'Google',
    category: TransactionCategory.generalMerchandise,
    paymentChannel: PaymentChannel.online,
  ),

  // Dec 20 — Gas
  Transaction(
    id: 'txn_yr_023',
    accountId: 'acc_yr_checking',
    amount: 37.54,
    date: DateTime(2025, 12, 20),
    name: 'FastGas #09241',
    merchantName: 'FastGas',
    category: TransactionCategory.transportation,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 22 — Uber
  Transaction(
    id: 'txn_yr_024',
    accountId: 'acc_yr_checking',
    amount: 18.43,
    date: DateTime(2025, 12, 22),
    name: 'Waymo Ride',
    merchantName: 'Waymo',
    category: TransactionCategory.transportation,
    paymentChannel: PaymentChannel.online,
  ),

  // Dec 23 — Groceries
  Transaction(
    id: 'txn_yr_025',
    accountId: 'acc_yr_checking',
    amount: 47.82,
    date: DateTime(2025, 12, 23),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 24 — Barnes & Noble
  Transaction(
    id: 'txn_yr_026',
    accountId: 'acc_yr_checking',
    amount: 14.99,
    date: DateTime(2025, 12, 24),
    name: 'Page & Spine Books',
    merchantName: 'Page & Spine',
    category: TransactionCategory.shopping,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 28 — Coffee
  Transaction(
    id: 'txn_yr_027',
    accountId: 'acc_yr_checking',
    amount: 5.50,
    date: DateTime(2025, 12, 28),
    name: 'Morning Brew Coffee',
    merchantName: 'Morning Brew Coffee',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 30 — Groceries
  Transaction(
    id: 'txn_yr_028',
    accountId: 'acc_yr_checking',
    amount: 55.09,
    date: DateTime(2025, 12, 30),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Dec 31 — Credit card payment (pays off statement balance)
  Transaction(
    id: 'txn_yr_028b',
    accountId: 'acc_yr_credit',
    amount: -43.47,
    date: DateTime(2025, 12, 31),
    name: 'Horizon Card Payment',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // ── January 2026 ───────────────────────────────────────────────────

  // Jan 1 — Paycheck
  Transaction(
    id: 'txn_yr_029',
    accountId: 'acc_yr_checking',
    amount: -2650,
    date: DateTime(2026),
    name: 'ACME CORP PAYROLL',
    merchantName: 'ACME CORP',
    category: TransactionCategory.income,
    paymentChannel: PaymentChannel.other,
  ),

  // Jan 1 — Rent
  Transaction(
    id: 'txn_yr_030',
    accountId: 'acc_yr_checking',
    amount: 1100,
    date: DateTime(2026),
    name: 'Bank Transfer - Rent',
    category: TransactionCategory.rentAndUtilities,
    paymentChannel: PaymentChannel.other,
  ),

  // Jan 2 — Savings transfer (checking side)
  Transaction(
    id: 'txn_yr_031',
    accountId: 'acc_yr_checking',
    amount: 500,
    date: DateTime(2026, 1, 2),
    name: 'Transfer to Summit Savings',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Jan 2 — Savings transfer (savings side)
  Transaction(
    id: 'txn_yr_032',
    accountId: 'acc_yr_savings',
    amount: -500,
    date: DateTime(2026, 1, 2),
    name: 'Transfer from First National',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Jan 3 — Groceries
  Transaction(
    id: 'txn_yr_033',
    accountId: 'acc_yr_checking',
    amount: 43.67,
    date: DateTime(2026, 1, 3),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 4 — YouTube Premium (credit card)
  Transaction(
    id: 'txn_yr_034',
    accountId: 'acc_yr_credit',
    amount: 13.99,
    date: DateTime(2026, 1, 4),
    name: 'YouTube Premium',
    merchantName: 'Google',
    category: TransactionCategory.entertainment,
    paymentChannel: PaymentChannel.online,
  ),

  // Jan 4 — Google One (credit card)
  Transaction(
    id: 'txn_yr_035',
    accountId: 'acc_yr_credit',
    amount: 1.99,
    date: DateTime(2026, 1, 4),
    name: 'Google One Storage',
    merchantName: 'Google',
    category: TransactionCategory.shopping,
    paymentChannel: PaymentChannel.online,
  ),

  // Jan 5 — Planet Fitness
  Transaction(
    id: 'txn_yr_036',
    accountId: 'acc_yr_checking',
    amount: 29.99,
    date: DateTime(2026, 1, 5),
    name: 'FitLife Gym Monthly',
    merchantName: 'FitLife Gym',
    category: TransactionCategory.personalCare,
    paymentChannel: PaymentChannel.online,
  ),

  // Jan 6 — Gas
  Transaction(
    id: 'txn_yr_037',
    accountId: 'acc_yr_checking',
    amount: 45.30,
    date: DateTime(2026, 1, 6),
    name: 'QuickFuel #13847',
    merchantName: 'QuickFuel',
    category: TransactionCategory.transportation,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 7 — Chipotle
  Transaction(
    id: 'txn_yr_038',
    accountId: 'acc_yr_checking',
    amount: 12.85,
    date: DateTime(2026, 1, 7),
    name: 'Burrito Bowl Co',
    merchantName: 'Burrito Bowl',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 8 — Coffee
  Transaction(
    id: 'txn_yr_039',
    accountId: 'acc_yr_checking',
    amount: 5.50,
    date: DateTime(2026, 1, 8),
    name: 'Morning Brew Coffee',
    merchantName: 'Morning Brew Coffee',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 10 — Car Insurance
  Transaction(
    id: 'txn_yr_040',
    accountId: 'acc_yr_checking',
    amount: 95,
    date: DateTime(2026, 1, 10),
    name: 'SafeRide Auto Insurance',
    merchantName: 'SafeRide',
    category: TransactionCategory.rentAndUtilities,
    paymentChannel: PaymentChannel.online,
  ),

  // Jan 10 — Google Fi
  Transaction(
    id: 'txn_yr_041',
    accountId: 'acc_yr_checking',
    amount: 35,
    date: DateTime(2026, 1, 10),
    name: 'Google Fi Wireless',
    merchantName: 'Google Fi',
    category: TransactionCategory.rentAndUtilities,
    paymentChannel: PaymentChannel.online,
  ),

  // Jan 11 — Target
  Transaction(
    id: 'txn_yr_042',
    accountId: 'acc_yr_checking',
    amount: 28.47,
    date: DateTime(2026, 1, 11),
    name: 'HomeMart T-2174',
    merchantName: 'HomeMart',
    category: TransactionCategory.generalMerchandise,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 12 — Groceries
  Transaction(
    id: 'txn_yr_043',
    accountId: 'acc_yr_checking',
    amount: 58.91,
    date: DateTime(2026, 1, 12),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 14 — Google Play (credit card)
  Transaction(
    id: 'txn_yr_044',
    accountId: 'acc_yr_credit',
    amount: 19.99,
    date: DateTime(2026, 1, 14),
    name: 'Google Play',
    merchantName: 'Google',
    category: TransactionCategory.entertainment,
    paymentChannel: PaymentChannel.online,
  ),

  // Jan 15 — Paycheck
  Transaction(
    id: 'txn_yr_045',
    accountId: 'acc_yr_checking',
    amount: -2650,
    date: DateTime(2026, 1, 15),
    name: 'ACME CORP PAYROLL',
    merchantName: 'ACME CORP',
    category: TransactionCategory.income,
    paymentChannel: PaymentChannel.other,
  ),

  // Jan 16 — Savings transfer (checking side)
  Transaction(
    id: 'txn_yr_046',
    accountId: 'acc_yr_checking',
    amount: 500,
    date: DateTime(2026, 1, 16),
    name: 'Transfer to Summit Savings',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Jan 16 — Savings transfer (savings side)
  Transaction(
    id: 'txn_yr_047',
    accountId: 'acc_yr_savings',
    amount: -500,
    date: DateTime(2026, 1, 16),
    name: 'Transfer from First National',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Jan 17 — Groceries
  Transaction(
    id: 'txn_yr_048',
    accountId: 'acc_yr_checking',
    amount: 35.42,
    date: DateTime(2026, 1, 17),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 18 — Gas
  Transaction(
    id: 'txn_yr_049',
    accountId: 'acc_yr_checking',
    amount: 39.76,
    date: DateTime(2026, 1, 18),
    name: 'FastGas #09241',
    merchantName: 'FastGas',
    category: TransactionCategory.transportation,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 19 — Chipotle
  Transaction(
    id: 'txn_yr_050',
    accountId: 'acc_yr_checking',
    amount: 14.20,
    date: DateTime(2026, 1, 19),
    name: 'Burrito Bowl Co',
    merchantName: 'Burrito Bowl',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 20 — Google Store (credit card)
  Transaction(
    id: 'txn_yr_051',
    accountId: 'acc_yr_credit',
    amount: 34.99,
    date: DateTime(2026, 1, 20),
    name: 'Google Store',
    merchantName: 'Google',
    category: TransactionCategory.generalMerchandise,
    paymentChannel: PaymentChannel.online,
  ),

  // Jan 21 — Uber
  Transaction(
    id: 'txn_yr_052',
    accountId: 'acc_yr_checking',
    amount: 14.87,
    date: DateTime(2026, 1, 21),
    name: 'Waymo Ride',
    merchantName: 'Waymo',
    category: TransactionCategory.transportation,
    paymentChannel: PaymentChannel.online,
  ),

  // Jan 23 — Coffee
  Transaction(
    id: 'txn_yr_053',
    accountId: 'acc_yr_checking',
    amount: 5.50,
    date: DateTime(2026, 1, 23),
    name: 'Morning Brew Coffee',
    merchantName: 'Morning Brew Coffee',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 25 — Groceries
  Transaction(
    id: 'txn_yr_054',
    accountId: 'acc_yr_checking',
    amount: 64.33,
    date: DateTime(2026, 1, 25),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 28 — Chipotle
  Transaction(
    id: 'txn_yr_055',
    accountId: 'acc_yr_checking',
    amount: 13.15,
    date: DateTime(2026, 1, 28),
    name: 'Burrito Bowl Co',
    merchantName: 'Burrito Bowl',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 30 — Groceries
  Transaction(
    id: 'txn_yr_056',
    accountId: 'acc_yr_checking',
    amount: 41.58,
    date: DateTime(2026, 1, 30),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Jan 31 — Credit card payment (pays off statement balance)
  Transaction(
    id: 'txn_yr_056b',
    accountId: 'acc_yr_credit',
    amount: -70.96,
    date: DateTime(2026, 1, 31),
    name: 'Horizon Card Payment',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // ── February 2026 ──────────────────────────────────────────────────

  // Feb 1 — Paycheck
  Transaction(
    id: 'txn_yr_057',
    accountId: 'acc_yr_checking',
    amount: -2650,
    date: DateTime(2026, 2),
    name: 'ACME CORP PAYROLL',
    merchantName: 'ACME CORP',
    category: TransactionCategory.income,
    paymentChannel: PaymentChannel.other,
  ),

  // Feb 1 — Rent
  Transaction(
    id: 'txn_yr_058',
    accountId: 'acc_yr_checking',
    amount: 1100,
    date: DateTime(2026, 2),
    name: 'Bank Transfer - Rent',
    category: TransactionCategory.rentAndUtilities,
    paymentChannel: PaymentChannel.other,
  ),

  // Feb 2 — Savings transfer (checking side)
  Transaction(
    id: 'txn_yr_059',
    accountId: 'acc_yr_checking',
    amount: 500,
    date: DateTime(2026, 2, 2),
    name: 'Transfer to Summit Savings',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Feb 2 — Savings transfer (savings side)
  Transaction(
    id: 'txn_yr_060',
    accountId: 'acc_yr_savings',
    amount: -500,
    date: DateTime(2026, 2, 2),
    name: 'Transfer from First National',
    category: TransactionCategory.transfer,
    paymentChannel: PaymentChannel.other,
  ),

  // Feb 3 — Groceries
  Transaction(
    id: 'txn_yr_061',
    accountId: 'acc_yr_checking',
    amount: 49.26,
    date: DateTime(2026, 2, 3),
    name: 'Fresh Harvest #742',
    merchantName: 'Fresh Harvest',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
  ),

  // Feb 4 — YouTube Premium (credit card)
  Transaction(
    id: 'txn_yr_062',
    accountId: 'acc_yr_credit',
    amount: 13.99,
    date: DateTime(2026, 2, 4),
    name: 'YouTube Premium',
    merchantName: 'Google',
    category: TransactionCategory.entertainment,
    paymentChannel: PaymentChannel.online,
  ),

  // Feb 4 — Google One (credit card)
  Transaction(
    id: 'txn_yr_063',
    accountId: 'acc_yr_credit',
    amount: 1.99,
    date: DateTime(2026, 2, 4),
    name: 'Google One Storage',
    merchantName: 'Google',
    category: TransactionCategory.shopping,
    paymentChannel: PaymentChannel.online,
  ),

  // Feb 5 — Gas (pending)
  Transaction(
    id: 'txn_yr_064',
    accountId: 'acc_yr_checking',
    amount: 41.33,
    date: DateTime(2026, 2, 5),
    name: 'QuickFuel #13847',
    merchantName: 'QuickFuel',
    category: TransactionCategory.transportation,
    paymentChannel: PaymentChannel.inStore,
    pending: true,
  ),

  // Feb 5 — Coffee (pending)
  Transaction(
    id: 'txn_yr_065',
    accountId: 'acc_yr_checking',
    amount: 5.50,
    date: DateTime(2026, 2, 5),
    name: 'Morning Brew Coffee',
    merchantName: 'Morning Brew Coffee',
    category: TransactionCategory.foodAndDrink,
    paymentChannel: PaymentChannel.inStore,
    pending: true,
  ),
];
