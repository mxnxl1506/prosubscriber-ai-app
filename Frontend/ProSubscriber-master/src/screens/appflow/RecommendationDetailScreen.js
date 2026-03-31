import React from "react";
import { useState, useEffect } from "react";

import RecommedationDetailView from "../../views/appflow/RecommedationDetailView";
import { ip } from "../../utils/IP";


import { useRoute } from "@react-navigation/native";
import { isLoaded, isLoading } from "expo-font";


import axios from "axios";

import { auth } from "../../../firebaseConfig";

const RecommendationDetailScreen = () => {
  
  const route = useRoute();

  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchAppLink = async () => {
    try {
      const { recommendation } = route.params;
      const response = await axios.request({
        method: "GET", 
        url: `http://${ip}:8080/plans/googleplay/${recommendation.serviceName}`
      });
      setData(response.data);
    }
    catch (error) {
      console.log(error);
    }
    finally {
      setLoading(false); // Set loading state to false when data fetching is complete
    }
  };

  useEffect(() => { 
    fetchAppLink(); 
  }, []); 

  const { recommendation } = route.params;

  // return <RecommedationDetailView recommendation={recommendation} link={data}/>;
  
  if (!loading) {
    return <RecommedationDetailView recommendation={recommendation} link={data}/>;
  }

};

export default RecommendationDetailScreen;
