const functions = require('firebase-functions');
const admin = require('firebase-admin');
const twilio = require('twilio');

admin.initializeApp();

const accountSid = 'YOUR_TWILIO_ACCOUNT_SID';
const authToken = 'YOUR_TWILIO_AUTH_TOKEN';
const client = new twilio(accountSid, authToken);

exports.notifyOnBooking = functions.firestore
  .document('bookings/{bookingId}')
  .onCreate(async (snap, context) => {
    const bookingData = snap.data();
    const bookingTime = bookingData.time.toDate();
    const fiveMinutesBefore = new Date(bookingTime.getTime() - 5 * 60000);

    if (Date.now() < fiveMinutesBefore.getTime()) {
      // Send WhatsApp message
      const phoneNumber = bookingData.phoneNumber;
      const message = `Reminder: Your booking is in 5 minutes. Don't forget!`;

      try {
        await client.messages.create({
          body: message,
          from: 'YOUR_TWILIO_PHONE_NUMBER',
          to: phoneNumber,
        });

        console.log('WhatsApp message sent successfully!');
        return null;
      } catch (error) {
        console.error('Error sending WhatsApp message:', error);
        return null;
      }
    } else {
      console.log('Booking is not within the 5-minute window.');
      return null;
    }
  });
