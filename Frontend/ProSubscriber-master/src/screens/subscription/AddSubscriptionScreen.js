import React from "react";
import { useState, useEffect } from "react";
import AddSubscriptionView from "../../views/subscription/AddSubscriptionView";
import { ip } from "../../utils/IP";


import { useRoute } from "@react-navigation/native";

import axios from "axios";

const AddSubscriptionScreen = () => {

    const route = useRoute();

    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);

    const fetchPlanData = async () => {
        try {
            const { serviceName } = route.params;
            const response = await axios.request({
                method: "GET", 
                url: `http://${ip}:8080/plans/all/${serviceName}`
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
        fetchPlanData(); 
    }, []); 

    console.log("Plan details in screen: ", data);

    if(!loading){
        return <AddSubscriptionView subscriptionPlans={data} />
    }
}

export default AddSubscriptionScreen;