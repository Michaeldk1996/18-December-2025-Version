const admin = require("firebase-admin/app");
admin.initializeApp();

const handleCheckoutRedirect = require("./handle_checkout_redirect.js");
exports.handleCheckoutRedirect = handleCheckoutRedirect.handleCheckoutRedirect;
const deleteUserAccount = require("./delete_user_account.js");
exports.deleteUserAccount = deleteUserAccount.deleteUserAccount;
