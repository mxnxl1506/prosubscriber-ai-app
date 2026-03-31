import React, { useEffect, useState } from "react";
import HomeView from "../../views/appflow/HomeView";
import { ip } from "../../utils/IP";


import axios from "axios";

// import { onAuthStateChanged } from "firebase/auth";

import { auth } from "../../../firebaseConfig";

//var ip = '192.168.1.16'

const HomeScreen = () => {
  
  const [subscriptionsData, setSubscriptionsData] = useState([]);
  const [recommendationsData, setRecommendationsData] = useState([]);
  const [error, setError] = useState(null);

  const [loading, setLoading] = useState(true);

  useEffect(() => {

    const fetchData = async (email) => {

      console.log('User in fetch data function:', email);
    
      const requests = [
        axios.get(`http://${ip}:8080/subscription/${email}`),
        axios.get(`http://${ip}:8080/recommendations/${email}`)
      ];
  
      return await Promise.all(requests)
        .then(([response1, response2]) => {
          setSubscriptionsData(response1.data);
          setRecommendationsData(response2.data);
        })
        .catch(error => {
          setError(error.message);
      });
  
    };

    const unsubscribe = auth.onAuthStateChanged(async (user) => {
      if (user) {
        console.log('User in onAuthState function:', user.email); // Log the user object
        await fetchData(user.email);
      } else {
        console.log('No user signed in');
        setSubscriptionsData(null);
        setRecommendationsData(null);
      }
    }, (error) => {
      console.log('Authentication error:', error); // Log authentication errors
    });

    // Clean up subscription
    return unsubscribe;
  }, []);

  // console.log(error);

  return <HomeView subscriptions={subscriptionsData} recommendations={recommendationsData}/>;

};

export default HomeScreen;