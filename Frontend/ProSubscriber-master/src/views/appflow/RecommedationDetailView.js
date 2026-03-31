import React from "react";
import {
  View,
  Text,
  ImageBackground,
  StyleSheet,
  Image,
  Dimensions,
  TouchableOpacity,
  Linking,
} from "react-native";

import { AppImages } from "../../utils/AppImages";
import { AppColors } from "../../utils/AppColors";

import Header from "../../components/Header";
import HomeMenuButtons from "../../components/HomeMenuButtons";

import fetchLogo from "../../../hooks/fetchLogo";

const { width, height } = Dimensions.get("window");

const RecommedationDetailView = (prop) => {
  
  const imagePath = fetchLogo(prop.recommendation.serviceName);

  return (  

    <ImageBackground
      source={AppImages.onboarding_bg}
      style={styles.bgContainer}
    >
      <View style={styles.container}>
        {/* backIcon */}
        <Header title="Details"  />
        <View style={{ alignItems: "center", marginTop: "10%" }}>
          <Image source={imagePath} style={styles.logo} />
          <Text style={styles.boldText}>{prop.recommendation.serviceName}</Text>
        </View>
        <View style={{ gap: 8, marginTop: 24 }}>
          <Text style={styles.title}>Advantages</Text>
          <Text style={styles.text}>
            {prop.recommendation.advantages}
          </Text>
        </View>
        <TouchableOpacity
          onPress={() => {
            Linking.openURL(prop.link);
          }}
          style={styles.button}
        >
          <Text style={styles.buttonText}>Download app</Text>
          <Image source={AppImages.arrow_right} style={styles.arrow} />
        </TouchableOpacity>
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
    paddingHorizontal: 16,
    flex: 1,
  },
  logo: {
    width: 96,
    height: 96,
    resizeMode: "contain",
  },
  boldText: {
    fontSize: 25,
    fontFamily: "Sora-SemiBold",
    color: AppColors.secondaryColor,
    marginTop: 20,
  },
  title: {
    fontSize: 20,
    fontFamily: "Sora-SemiBold",
    color: AppColors.secondaryColor,
  },
  text: {
    fontSize: 18,
    color: "#1E1E24",
    fontFamily: "Sora-Regular",
  },
  arrow: {
    width: 32,
    height: 32,
    transform: [{ rotate: "-45deg" }],
  },
  button: {
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    alignSelf: "flex-end",
    columnGap: 8,
    padding: 8,
    borderRadius: 45,
    width: width * 0.6,
    height: height * 0.06,
    marginTop: 40,
    backgroundColor: AppColors.buttonColor,
    height: 56,
  },
  buttonText: {
    color: "white",
    fontSize: 20,
    fontFamily: "Sora-Regular",
  },
});

export default RecommedationDetailView;
