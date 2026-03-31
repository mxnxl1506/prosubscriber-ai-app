import React from "react";
import { useState, useEffect } from "react";
import TransactionView from "../../views/appflow/TransactionView";
import { ip } from "../../utils/IP";

import { auth } from "../../../firebaseConfig";

import axios from "axios";

const TransactionScreen = () => {

  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    
    const fetchSuscriptionData = async (email) => {
      console.log('User in fetch data function:', email);
      try {
        const response = await axios.request({
          method: "GET", 
          url: `http://${ip}:8080/transaction/${email}`
        });
        console.log(response.data);
        setData(response.data);
      }
      catch (error) {
        console.log(error);
      }
      finally {
        setLoading(false); // Set loading state to false when data fetching is complete
      }
    };

    const unsubscribe = auth.onAuthStateChanged(async (user) => {
      if (user) {
        console.log('User in onAuthState function:', user.email); // Log the user object
        await fetchSuscriptionData(user.email);
      } else {
        console.log('No user signed in');
        setUser(null);
        setSubscriptions(null);
      }
    }, (error) => {
      console.log('Authentication error:', error); // Log authentication errors
    });

    // Clean up subscription
    return unsubscribe;
  }, []);

  if (!loading) {
    return <TransactionView transactions={data} />;
  }

};

export default TransactionScreen;
