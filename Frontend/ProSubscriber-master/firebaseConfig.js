// Import the functions you need from the SDKs you need
// import * as firebase from "firebase";
import { initializeApp, getApp, getApps } from "firebase/app";
import { getAuth, initializeAuth } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAM9FeYlPpwBuQOESI2cXK0Y5YiWLuNrs4",
  authDomain: "prosubscriberauth.firebaseapp.com",
  projectId: "prosubscriberauth",
  storageBucket: "prosubscriberauth.appspot.com",
  messagingSenderId: "269679209377",
  appId: "1:269679209377:web:2db9ef4852f7e5268ff9e0"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// let app;
// if (getApps().length === 0) {
//   app = initializeApp(firebaseConfig);
// }
// else {
//   app = getApp();
// }

// const auth = getAuth(app);

// export {auth}

const auth = getAuth(app);

export {auth};