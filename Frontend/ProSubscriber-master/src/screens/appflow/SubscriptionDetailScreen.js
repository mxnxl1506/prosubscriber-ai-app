import React from "react";
import { useState, useEffect } from "react";
import SubscriptionDetailView from "../../views/appflow/SubscriptionDetailView";
import { ip } from "../../utils/IP";

import { useRoute } from "@react-navigation/native";

// import { onAuthStateChanged } from "firebase/auth";

import axios from "axios";

import { auth } from "../../../firebaseConfig";

const SubscriptionDetailScreen = () => {

  const route = useRoute();
  
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    
    const fetchSuscriptionData = async (email) => {
      console.log('User in fetch data function:', email);
      try {
        const { subscription } = route.params;
        const response = await axios.request({
          method: "GET", 
          url: `http://${ip}:8080/usage/displayUsage/${subscription.serviceName}/${email}`
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
        setData(null);
      }
    }, (error) => {
      console.log('Authentication error:', error); // Log authentication errors
    });

    // Clean up subscription
    return unsubscribe;
  }, []);
  
  console.log(data);
  
  const { subscription } = route.params;
  
  if(!loading){
    return <SubscriptionDetailView subscription={subscription} usageData = {data}/>;
  }
  // return <SubscriptionDetailView subscription={subscription} />;
};

export default SubscriptionDetailScreen;
