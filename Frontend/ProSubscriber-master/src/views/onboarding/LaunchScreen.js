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

import { AppImages } from "../../utils/AppImages";
import { AppColors } from "../../utils/AppColors";

import { useNavigation } from "@react-navigation/native";

import { auth } from "../../../firebaseConfig";

const { height, width } = Dimensions.get("window");

const LaunchScreen = () => {

  // useEffect(() => {
  //   const unsubscribe = auth.onAuthStateChanged(user => {
  //     if (user) {
  //       navigation.replace("HomeScreen");
  //     }
  // })

  //   return unsubscribe;
  // }, []);

  const navigation = useNavigation();

  const onPressContinue = () => {
    navigation.navigate("OnboardingScreen");
  };

  return (
    <ImageBackground
      source={AppImages.onboarding_bg}
      style={styles.bgContainer}
    >
      <View style={styles.container}>
        <Text style={styles.boldText}>Pro {"\n"} Subscriber</Text>
        <TouchableOpacity onPress={onPressContinue} style={styles.button2}>
          <Text style={[styles.buttonText]}>Continue</Text>
          <Image style={{ height: 32, width: 32 }} source={AppImages.arrow_right} />
        </TouchableOpacity>
      </View>
    </ImageBackground>
  );
};

const styles = StyleSheet.create({
  bgContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    height: "100%",
    width: "100%",
  },
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  boldText: {
    fontSize: 48,
    fontFamily: "Sora-Bold",
    textAlign: "center",
    margin: 20,
    width: width * 0.8,
    marginBottom: height * 0.2,
    color: AppColors.secondaryColor,
  },
  buttonText: {
    fontSize: 20,
    fontFamily: "Sora-Regular",
    color: "white",
  },
  button2: {
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    alignSelf: "center",
    position: "absolute",
    columnGap: 16,
    borderRadius: 45,
    width: width * 0.6,
    height: height * 0.06,
    bottom: height * 0.15,
    backgroundColor: AppColors.buttonColor,
    height: 56,
  },
});
export default LaunchScreen;
