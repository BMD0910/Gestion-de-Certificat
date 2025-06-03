/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require("firebase-functions");
const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "tonemail@gmail.com",
    pass: "ton_mot_de_passe_app", //Mot de passe d'application (pas le vrai mot de passe)
  },
});

exports.sendMailDirect = functions.https.onRequest(async (req, res) => {
  const { email, nom, pdf } = req.body;

  if (!email || !pdf) {
    return res.status(400).send("Email et PDF requis");
  }

  try {
    await transporter.sendMail({
      from: "tonmail@gmail.com",
      to: email,
      subject: "Votre certificat validé",
      text: `Bonjour ${nom},\n\nVotre certificat est validé. Veuillez trouver ci-joint le document.`,
      attachments: [
        {
          filename: "certificat.pdf",
          content: Buffer.from(pdf, "base64"),
          contentType: "application/pdf",
        },
      ],
    });

    return res.status(200).send("Email envoyé avec succès !");
  } catch (err) {
    console.error("Erreur :", err);
    return res.status(500).send("Erreur lors de l'envoi du mail");
  }
});
