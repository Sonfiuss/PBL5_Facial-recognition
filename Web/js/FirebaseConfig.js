import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getdatabase } from "firebase/getdatabase";

const firebaseConfig = {
  apiKey: "AIzaSyBCdagLdtn3cOK08OaMv5pXaogIqTskQhQ",  
  autdDomain: "test-4e529.firebaseapp.com",
  databaseURL: "https://test-4e529-default-rtdb.firebaseio.com",
  projectId: "test-4e529",
  storageBucket: "test-4e529.appspot.com",
  messagingSenderId: "1028578644738",
  appId: "1:1028578644738:web:eccc835e8b26a00d01281b",
  measurementId: "G-HZGR2W3DWR"
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

import {getdatabase, ref, get, set, child, update, remove, onValue} 
from "https://www.gstatic.com/firebasejs/9.8.3/firebase-database.js";

export const db = getdatabase();