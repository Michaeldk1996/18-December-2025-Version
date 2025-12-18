const functions = require("firebase-functions");
const admin = require("firebase-admin");
const cors = require("cors")({ origin: true });
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.handleCheckoutRedirect = functions
  .region("us-central1")
  .runWith({
    memory: "128MB",
  })
  .https.onRequest((req, res) => {
    cors(req, res, async () => {
      res.redirect(302, "bspconsult://bspconsult.com/homeNew");
    });
  });
