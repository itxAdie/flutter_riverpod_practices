import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:personal_finance_app/core/models/transaction_model.dart';
import 'package:personal_finance_app/core/services/sample_transactions_service.dart';
import 'package:personal_finance_app/utils/const/server_consts.dart';
import 'package:personal_finance_app/utils/logs/logger.dart';
// import 'package:personal_finance_app/utils/types/transaction_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_notifier.g.dart';

/// A class that notifies listeners of changes to transactions.
@Riverpod(keepAlive: true)
class TransactionsNotifier extends _$TransactionsNotifier {
  @override
  List<Transaction> build() {
    return state = getSampleTransactions();
  }

  /// Adds a transaction to the list of transactions.
  /// The transaction is added to the end of the list.
  void addTransaction(Transaction transaction) {
    state = [...state, transaction];
    Logger.log('Added transaction: $transaction');
  }

  /// Fetch transactions from the server.
  /// The transactions are fetched from the [remoteTransactionsFileUrl].
  /// The fetched transactions are added to the list of transactions.
  Future<void> fetchTransactions() async {
    try {
      final response = await http.get(Uri.parse(remoteTransactionsFileUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final transactions = data
            .map(
              (transactionJson) =>
                  Transaction.fromJson(transactionJson as Map<String, dynamic>),
            )
            .toList();
        state = [...state, ...transactions];
      } else {
        Logger.log('Failed to fetch transactions: ${response.statusCode}');
      }
    } catch (e) {
      Logger.log('Error fetching transactions: $e');
    }
  }

  /// Returns the total amount of all transactions with 2 decimal places
  double getTotalAmount() {
    return state.fold(0, (total, transaction) => total + transaction.amount);
  }

  /// Returns a unique transaction ID for a new transaction
  /// The ID is the smallest positive integer that is not already used by any transaction
  int getUniqueTransactionId() {
    final ids = state.map((transaction) => transaction.id).toSet();
    var id = 1;
    while (ids.contains(id)) {
      id++;
    }
    return id;
  }
}
