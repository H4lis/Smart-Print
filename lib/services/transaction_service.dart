import '../data/midtrans_service.dart';

class TransactionService {
  static Future<Map<String, dynamic>> createTransaction({
    required int price,
    required String orderId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    try {
      final transactionDetails = {
        "payment_type": "gopay",
        "transaction_details": {
          "order_id": orderId,
          "gross_amount": price,
        },
        "customer_details": {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone": phone,
        },
      };

      final response =
          await MidtransService.createTransaction(transactionDetails);
      return response;
    } catch (e) {
      throw Exception('Error during transaction: $e');
    }
  }
}
