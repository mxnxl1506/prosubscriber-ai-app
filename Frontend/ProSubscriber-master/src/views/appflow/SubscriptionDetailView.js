import React, { useState, useEffect } from "react";
import {
  View,
  Text,
  ImageBackground,
  StyleSheet,
  Image,
  Dimensions,
  ScrollView,
  TouchableOpacity,
} from "react-native";
import { AppImages } from "../../utils/AppImages";
import { AppColors } from "../../utils/AppColors";

import Header from "../../components/Header";
import HomeMenuButtons from "../../components/HomeMenuButtons";
import { ip } from "../../utils/IP";


import { LineChart } from "react-native-chart-kit";

import { auth } from "../../../firebaseConfig";

import axios from "axios";

import { useNavigation } from "@react-navigation/native";

import fetchLogo from "../../../hooks/fetchLogo";

const { width } = Dimensions.get("window");

const SubscriptionDetailView = (prop) => {

  const navigation = useNavigation();

  // console.log("inside view", prop.usageData);

  const [email, setEmail] = useState(null);
  
  
  const dateLabels = [];
  const hourPoints = [];

  const [data, setData] = useState(null);

  const setGraphData = () => {
    try {
      if(prop.usageData) {
        for(let i=0; i<7; i++){
          dateLabels.push(prop.usageData[i].dateMeasured);
        }
        for(let i=0; i<7; i++){
          hourPoints.push(prop.usageData[i].numHours);
        }
        console.log("date labels", dateLabels);
        const temp = {
          labels: dateLabels,
          datasets: [
            {
              data: hourPoints,
              color: (opacity = 1) => `rgba(7, 99, 216, ${opacity})`, // optional
              strokeWidth: 2, // optional
            },
          ],
          legend: ["Usage Data in hours"], // optional
        };
        setData(temp);
      } 
    }
    catch (error) {
      console.log(error);
    }
  }

  const [suggestCancellation, setSuggestCancellation] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {

    setGraphData();

    const fetchSuggestCancellation = async (email) => {
      console.log('User in fetch data function:', email);
      try {
        const response = await axios.request({
          method: "GET", 
          url: `http://${ip}:8080/usage/suggestCancellation/${prop.subscription.serviceName}/${email}`
        });
        console.log(response.data);
        setSuggestCancellation(response.data);
        console.log(suggestCancellation);
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
        fetchSuggestCancellation(user.email);
        // setEmail();
      } else {
        console.log('No user signed in');
      }
    }, (error) => {
      console.log('Authentication error:', error); // Log authentication errors
    });

    // Clean up subscription
    return unsubscribe;
  }, []);

  const deleteSubscription = async () => {
    try {
      const response = await axios.request({
        method: "DELETE", 
        url: `http://${ip}:8080/subscription/${email}/${prop.subscription.serviceName}`
      });
      console.log(response.data);
    }
    catch (error) {
      console.log(error);
    }
    finally {
      navigation.replace("SubscriptionListScreen");
    }
  };

  const chartConfig = {
    backgroundGradientFrom: "#FFFFFF",
    backgroundGradientFromOpacity: 1,
    backgroundGradientTo: "#FFFFFF",
    backgroundGradientToOpacity: 1,
    color: (opacity = 1) => `rgba(0, 0, 0, ${opacity})`,
    strokeWidth: 2,
    barPercentage: 0.5,
    useShadowColorFromDataset: false,
  };

  const imagePath = fetchLogo(prop.subscription.serviceName);

  return (
    <ImageBackground
      source={AppImages.onboarding_bg}
      style={styles.bgContainer}
    >
      <View style={styles.container}>
        {/* backIcon */}
        <Header title="Details"  />
        <ScrollView showsVerticalScrollIndicator={false}>
          <View style={{ alignItems: "center", marginTop: "10%" }}>
            <Image source={imagePath} style={styles.netflex} />
            <Text style={styles.boldText}>{prop.subscription.serviceName}</Text>
          </View>
          <View style={{ gap: 5 }}>
            <Text style={styles.title}>Cost</Text>
            <Text style={styles.text}>{prop.subscription.price} Dhs. - {prop.subscription.paymentFrequency}</Text>
          </View>
          <View style={{ gap: 5 }}>
            <Text style={styles.title}>Next Due</Text>
            <Text style={styles.text}>{prop.subscription.endDate}</Text>
          </View>
          <View style={{ gap: 5 }}>
            {data &&
              <Text style={styles.title}>Analytics</Text>
              &&
              <View>
                <LineChart
                  // data={tempData}
                  data={data}
                  style={{ borderRadius: 16, marginTop: 20, marginBottom: 32,}}
                  width={width - 40}
                  height={296}
                  chartConfig={chartConfig}
                  verticalLabelRotation={30}
                />
              </View>
            }
            {suggestCancellation && 
              <Text style={[styles.text, {color: AppColors.secondaryColor, marginBottom: 16}]}>
                Note: You haven't used this app in two weeks! Do you still want to keep it?
              </Text>
            }
            <TouchableOpacity style={styles.button} onPress={deleteSubscription}>
              <Text style={styles.button_text}>Remove</Text>
            </TouchableOpacity>
          </View>
        </ScrollView>
      </View>
      <HomeMenuButtons bgWhite />
    </ImageBackground>
  );
};

const styles = StyleSheet.create({
  bgContainer: {
    flex: 1,
    height: "100%",
    width: "100%",
  },
  container: {
    flex: 1,
    paddingHorizontal: 16,
  },
  netflex: {
    width: 120,
    height: 120,
  },
  boldText: {
    fontSize: 24,
    fontFamily: "Sora-SemiBold",
    color: AppColors.secondaryColor,
    marginTop: 20,
  },
  title: {
    fontSize: 20,
    fontFamily: "Sora-SemiBold",
    color: AppColors.secondaryColor,
    marginTop: 32,
  },
  text: {
    fontSize: 18,
    fontFamily: "Sora-Regular",
    color: "black",
    marginTop: 8,
  },
  button: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    alignSelf: "center",
    borderRadius: 45,
    width: width * 0.6,
    height: 56,
    backgroundColor: AppColors.buttonColor,
    marginTop: 16,
    marginBottom: 140,
  },
  button_text: {
    fontSize: 20,
    fontFamily: "Sora-Regular",
    color: "white",
  },
});

export default SubscriptionDetailView;
