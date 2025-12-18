const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.deleteUserAccount = functions.https.onCall(
  async (database, context) => {
    const userId = context.auth?.uid;

    let userDoc = await admin.firestore().collection("users").doc(userId).get();

    await admin
      .firestore()
      .collection("deleted_accounts")
      .doc(userId)
      .set(userDoc.data());

    await admin.auth().deleteUser(userId);

    return;
  },
);
