import React from "react";
import { useState, useEffect } from "react";
import ChooseSubcriptionView from "../../views/subscription/ChooseSubscriptionView";
import { ip } from "../../utils/IP";


import axios from "axios";

const ChooseSubcriptionScreen = () => {

    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);

    const fetchServiceNames = async () => {
        try {
          const response = await axios.request({
            method: "GET", 
            url: `http://${ip}:8080/plans/all`
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
    
    useEffect(() => { 
        fetchServiceNames(); 
    }, []); 

    console.log("service name is screen: ", data);
    
    if(!loading){
        return <ChooseSubcriptionView subscriptionServices={data}/>
    }

    // return(
    //     <ChooseSubcriptionView />
    // )

}

export default ChooseSubcriptionScreen;