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
  TextInput,
} from "react-native";

import { useNavigation } from "@react-navigation/native";

import { AppImages } from "../../utils/AppImages";
import { AppColors } from "../../utils/AppColors";

const { height, width } = Dimensions.get("window");

import { signInWithEmailAndPassword } from "firebase/auth";

import { auth } from "../../../firebaseConfig";

const OnBoardingView = (props) => {

  // useEffect(() => {
  //   const unsubscribe = auth.onAuthStateChanged(user => {
  //     if (user) {
  //       navigation.replace("HomeScreen");
  //     }
  // })

  //   return unsubscribe;
  // }, []);
  
  const navigation = useNavigation();

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const [errors, setErrors] = useState({}); 
  const [isFormValid, setIsFormValid] = useState(false);

  const validateForm = () => {
    let errors = {};

    if (!email) { 
      errors.email = 'Email is required.'; 
    } else if (!/\S+@\S+\.\S+/.test(email)) { 
      errors.email = 'Email is invalid.'; 
    }

    setErrors(errors); 
    setIsFormValid(Object.keys(errors).length === 0); 
  }

  useEffect(() => { 
    validateForm(); 
  }, [email]);

  const handleLogin = async () => {
    try {
      await signInWithEmailAndPassword(auth, email, password)
      .then(user => {
        console.log('User in login screen:', user.email);
        navigation.navigate("HomeScreen");
      })
    }
    catch (error) {
      alert('Authentication error:', error);
    }
  }
  
  return (
    <ImageBackground
      source={AppImages.onboarding_bg}
      style={styles.bgContainer}
    >
      {props.screenIndex !== 3 ? (
        <>
          <View style={styles.firstHalf}>
            <Image
              source={
                props.screenIndex === 0
                  ? AppImages.onboarding_1
                  : props.screenIndex === 1
                  ? AppImages.onboarding_2
                  : AppImages.onboarding_3
              }
              style={styles.image}
            />
            <Text style={styles.text}>
              {props.screenIndex === 0
                ? "Manage all your subscriptions in one place with ProSubscriber."
                : props.screenIndex === 1
                ? "Get personalized recommendations from our AI model based on your subscriptions."
                : "Get reminded of your upcoming payments through notifications."}
            </Text>
          </View>
          <TouchableOpacity onPress={props.onPressNext} style={styles.button}>
            <Text style={styles.buttonText}>Next</Text>
            <Image source={AppImages.arrow_right} style={styles.arrow} />
          </TouchableOpacity>
        </>
      ) : (
        <View style={styles.container}>
          <Text style={styles.boldText}>Pro {"\n"} Subscriber</Text>
          <View>
            <Text style={styles.label}>Email ID</Text>
            <TextInput 
              placeholder="Enter your email" 
              value={email}
              onChangeText={text => setEmail(text.trim())}
              style={[styles.input,{marginBottom: 4}]} 
            />
            <Text style={[styles.error_msg,{marginBottom: 20}]}>
                {errors.email}
            </Text>
            <Text style={styles.label}>Password</Text>
            <TextInput
              placeholder="Enter password"
              secureTextEntry
              value={password}
              onChangeText={text => setPassword(text)}
              style={styles.input}
              />
          </View>
          
          <TouchableOpacity
            style={[styles.button2, { opacity: isFormValid ? 1 : 0.5 }]}
            onPress={handleLogin}
            disabled={!isFormValid}
          >
            <Text
              style={styles.buttonText}
            >
              Login
            </Text>
          </TouchableOpacity>
          <TouchableOpacity
            onPress={() => navigation.navigate("SignupScreen")}
            style={[styles.button2, { marginTop: 16, backgroundColor: "white", borderWidth: 2, borderColor: AppColors.buttonColor }]}
          >
            <Text
              style={[styles.buttonText, { color: "black" }]}
            >
              Sign up
            </Text>
          </TouchableOpacity>
        </View>
      )}
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
  image: {
    width: width * 0.5,
    height: height * 0.3,
    resizeMode: "contain",
  },
  label: {
    fontFamily: "Sora-Regular",
    fontSize: 18,
    marginBottom: 8,
  },
  input: {
    backgroundColor: "white",
    height: 48,
    width: width * 0.9,
    padding: 10,
    borderRadius: 10,
    marginBottom: 20,
  },
  arrow: {
    width: 32,
    height: 32,
  },
  text: {
    fontSize: 24,
    fontFamily: "Sora-Regular",
    textAlign: "center",
    width: width * 0.8,
    color: "black",
  },
  firstHalf: {
    justifyContent: "center",
    alignItems: "center",
    flex: 1,
  },
  button: {
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    columnGap: 16,
    backgroundColor: AppColors.buttonColor,
    width: width * 0.6,
    height: height * 0.06,
    borderRadius: 45,
    bottom: height * 0.15,
    height: 56,
  },
  buttonText: {
    color: "white",
    fontFamily: "Sora-Regular",
    fontSize: 20,
  },
  boldText: {
    fontSize: 48,
    fontFamily: "Sora-Bold",
    textAlign: "center",
    margin: 20,
    // width: width * 0.8,
    color: AppColors.secondaryColor,
    marginBottom: height * 0.08,
  },
  button2: {
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    alignSelf: "center",
    backgroundColor: AppColors.buttonColor,
    padding: 8,
    borderRadius: 45,
    width: width * 0.6,
    height: height * 0.06,
    marginTop: height * 0.06,
    height: 56,
  },
  error_msg: {
    fontFamily: "Sora-Regular",
    fontSize: 12,
    color: AppColors.red,
    opacity: 0.5,
  },
});
export default OnBoardingView;
