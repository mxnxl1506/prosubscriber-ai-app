import React from "react";
import { useState, useEffect } from "react";
import {
  View,
  Text,
  ImageBackground,
  StyleSheet,
  Image,
  Dimensions,
  TouchableOpacity,
} from "react-native";

import { AppColors } from "../../utils/AppColors";
import { AppImages } from "../../utils/AppImages";

import HomeMenuButtons from "../../components/HomeMenuButtons";
import ConfirmationPopup from "../../components/ConfirmationPopup";

import { ip } from "../../utils/IP";

import axios from "axios";

import { auth } from "../../../firebaseConfig";

import { Entypo, MaterialIcons } from "@expo/vector-icons";

const { width, height } = Dimensions.get("window");

const ProfileView = (props) => {

  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [email, setEmail] = useState(null);

  useEffect(() => {
    
    const fetchSuscriptionData = async (email) => {
      console.log('User in fetch data function:', email);
      try {
        const response = await axios.request({
          method: "GET", 
          url: `http://${ip}:8080/user/${email}`
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
        // setUser(user);
        setEmail(user.email);
        await fetchSuscriptionData(user.email);
      } else {
        console.log('No user signed in');
        // setEmail(null);
        // setData(null);
      }
    }, (error) => {
      console.log('Authentication error:', error); // Log authentication errors
    });

    // Clean up subscription
    return unsubscribe;
  }, []);

  if(!loading){
    return (
      <ImageBackground
        source={AppImages.onboarding_bg}
        style={styles.bgContainer}
      >
        <View style={styles.container}>
          <Text style={styles.name}>{data.name}</Text>
          <Text style={styles.email}>{email}</Text>
          <View style={{ marginTop: "20%" }}>
            <TouchableOpacity onPress={props.onPressLogout} style={styles.button}>
              <MaterialIcons name="logout" size={30} color="black" />
              <Text style={styles.btnText}>Logout</Text>
            </TouchableOpacity>
            <TouchableOpacity onPress={props.onPressDelete} style={[styles.button, {borderWidth:2, borderColor: "red"}]}>
              <Entypo name="cross" size={30} color="black" />
              <Text style={styles.btnText}>Delete Profile</Text>
            </TouchableOpacity>
          </View>
        </View>
        <ConfirmationPopup
          title={props.isVisible}
          isVisible={props.isVisible ? true : false}
          onPressCancel={props.onPressCancel}
          onPressYes={props.onPressYes}
        />
        <HomeMenuButtons bgWhite />
      </ImageBackground>
    );
  }
};

const styles = StyleSheet.create({
  bgContainer: {
    flex: 1,
    height: "100%",
    width: "100%",
  },
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    alignSelf: "center",
  },
  name: {
    fontSize: 24,
    fontFamily: "Sora-SemiBold",
    color: AppColors.secondaryColor,
    marginBottom: 8,
  },
  email: {
    fontSize: 20,
    color: AppColors.secondaryColor,
    fontFamily: "Sora-Regular",
  },
  button: {
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: "white",
    padding: 12,
    borderRadius: 8,
    elevation: 5,
    marginVertical: 8,
    width: width * 0.6,
    height: height * 0.06,
    columnGap: 16,
    height: 56,
  },
  btnText: {
    fontSize: 18,
    color: "black",
    fontFamily: "Sora-Regular",
  },
});

export default ProfileView;
