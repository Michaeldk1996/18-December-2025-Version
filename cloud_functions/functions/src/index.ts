/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {onRequest} from "firebase-functions/v2/https";
import {createCheckoutSession} from "./createCheckoutSession";

export const createCheckoutSessionFunctionV2 = onRequest(
  {
    cors: true,
    region: "us-central1",
    invoker: "public", // Allow unauthenticated access
  },
  createCheckoutSession
);

// export const closePaymentTab = functions.https.onRequest((req, res) => {
//   res.set("Content-Type", "text/html");
//   res.send(`
//     <!DOCTYPE html>
//     <html>
//       <head>
//         <meta charset="utf-8" />
//         <title>Closing...</title>
//         <script>
//           window.onload = function() {
//             try { window.close(); } catch(e) {}
//           }
//         </script>
//       </head>
//       <body>
//         <p>Payment complete. You can close this window.</p>
//       </body>
//     </html>
//   `);
// });
