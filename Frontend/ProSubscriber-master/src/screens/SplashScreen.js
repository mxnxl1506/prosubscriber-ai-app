import React, { useRef, useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  Animated,
  Easing,
  Dimensions,
} from "react-native";
import { AppColors } from "../utils/AppColors";
import { useNavigation } from "@react-navigation/native";

const { width, height } = Dimensions.get("window");
const SplashScreen = () => {
  const navigation = useNavigation();
  const sizeValue = useRef(new Animated.Value(170)).current;
  const [isCubeDisplay, setIsCubeDisplay] = useState(true);

  // Animation configuration
  const animateShape = () => {
    Animated.sequence([
      Animated.timing(sizeValue, {
        toValue: 60,
        duration: 2500,
        easing: Easing.linear,
        useNativeDriver: false,
      }),
    ]).start();
  };

  React.useEffect(() => {
    animateShape();
    setTimeout(() => {
      setIsCubeDisplay(false);
    }, 2500);
    setTimeout(() => {
      navigation.navigate("LaunchScreen");
    }, 3500);
  }, []);

  return (
    <View style={styles.container}>
      <Animated.View
        style={[
          styles.shape,
          {
            width: sizeValue,
            height: sizeValue,
            display: isCubeDisplay ? "flex" : "none",
            borderRadius: sizeValue.interpolate({
              inputRange: [100, 200],
              outputRange: [100, 10],
            }),
            transform: [
              {
                rotate: sizeValue.interpolate({
                  inputRange: [100, 200],
                  outputRange: ["0deg", "360deg"],
                }),
              },
            ],
          },
        ]}
      />
      <Text
        style={[
          styles.text,
          {
            display: isCubeDisplay ? "none" : "flex",
          },
        ]}
      >
        Pro {"\n"} Subscriber
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: AppColors.secondaryColor,
  },
  shape: {
    backgroundColor: "white", // Change color as needed
  },
  text: {
    fontSize: 50,
    fontFamily: "Sora-Bold",
    textAlign: "center",
    margin: 20,
    width: width * 0.8,
    color: "white",
    marginBottom: height * 0.2,
  },
});

export default SplashScreen;
