const functions = require("firebase-functions");
const axios = require("axios");

const MIDTRANS_SERVER_KEY = "SB-Mid-server-ygjZkxwYMVgWXpHMsp1lMKiZ";

exports.createTransaction = functions.https.onRequest(async (req, res) => {
  const {orderId, amount} = req.body;

  const transactionData = {
    transaction_details: {
      order_id: orderId,
      gross_amount: amount,
    },
    customer_details: {
      first_name: "NamaDepan",
      last_name: "NamaBelakang",
      email: "email@example.com",
      phone: "081234567890",
    },
  };

  try {
    const response = await axios.post(
        "https://api.sandbox.midtrans.com/v2/charge",
        transactionData,
        {
          headers: {
            "Content-Type": "application/json",
            "Authorization": `Basic ${Buffer.from(MIDTRANS_SERVER_KEY)
                .toString("base64")}`,
          },
        },
    );

    // Mengembalikan Snap Token ke client
    res.status(200).json(response.data);
  } catch (error) {
    res.status(500).json({error: error.message});
  }
});
