import React from "react";
import { useState, useEffect } from "react";

import { View, Text, TextInput, Switch, TouchableOpacity, Image, ImageBackground, StyleSheet, Dimensions, ScrollView, KeyboardAvoidingView, Platform } from "react-native";

import { AppColors } from "../../utils/AppColors";
import { AppImages } from "../../utils/AppImages";

const { height, width } = Dimensions.get("window");

import { useNavigation } from "@react-navigation/native";

import axios from "axios";

import { createUserWithEmailAndPassword } from "firebase/auth";
import { auth } from "../../../firebaseConfig";

import RNPickerSelect from 'react-native-picker-select';

const SignupView = () => {

    const navigation = useNavigation();

    //switch
    const [isStudent, setisStudent] = useState(false);
    const toggleSwitch = () => setisStudent(previousState => !previousState);
  
    //form validation
    const [name, setName] = useState('')
    const [email, setEmail] = useState('')
    const [dob, setDob] = useState('')
    const [gender, setGender] = useState('')
    const [password, setPassword] = useState('')
    const [confirmPassword, setConfirmPassword] = useState('')

    const genderPlaceholder = {
      label: 'Click to select the Gender...',
      value: null,
    };

    const genderOptions = [
      { label: 'Male', value: 'M' },
      { label: 'Female', value: 'F' },
    ];
  
    const [errors, setErrors] = useState({}); 
    const [isFormValid, setIsFormValid] = useState(false);
  
    
    const validateForm = () => { 
      let errors = {}; 
  
      // Validate name field 
      if (!name) { 
        errors.name = 'Name is required.'; 
      } else if (!/^[A-Za-z]+(?:\s+[A-Za-z]+)*/.test(name)) {
        errors.name = 'Name can contain only alphabets.' ;
      }
  
      // Validate email field 
      if (!email) { 
        errors.email = 'Email is required.'; 
      } else if (!/\S+@\S+\.\S+/.test(email)) { 
        errors.email = 'Email is invalid.'; 
      } 

      if (!dob) {
        errors.dob = 'Date of Birth is required.';
      } else if (!/\b\d{2}\/\d{2}\/\d{4}\b/.test(dob)) {
        errors.dob = 'Date format is incorrect';
      }
  
      if (!gender) {
        errors.gender = 'Gender is required.';
      } else if (!gender.toLowerCase() === 'male' || gender.toLowerCase() === 'female') {
        errors.gender = 'Gender should be either male or female.'
      }
      
      // Validate password field 
      if (!password) { 
        errors.password = 'Password is required.'; 
      } else if (!/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/.test(password)) { 
        errors.password = 'Password must contain atleast\n - 6 digits\n - One uppercase letter\n - One lowercase letter\n - One digit\n - One special character'; 
      }
      
      if (!confirmPassword) { 
        errors.confirmPassword = 'Confirmation is required.'; 
      } else if (confirmPassword != password) { 
        errors.confirmPassword = 'Passwords do not match.';
      }
      
      // Set the errors and update form validity 
      setErrors(errors); 
      setIsFormValid(Object.keys(errors).length === 0); 
    }; 
    
    useEffect(() => { 
      validateForm(); 
    }, [name, email, dob, gender, password, confirmPassword]); 

    const handleSignUp = async () => {

      createUserWithEmailAndPassword(auth, email, password)
          .then(userCredentials => {
            const user = userCredentials.user;
            console.log('Registered with:', user.email);
          })
          .catch(error => alert(error.message))

      // if (isFormValid) {
      //   try {
      //     const response = await axios.post(
      //       // method: "POST", 
      //       `http://192.168.120.71:8080/user`,
      //       {
      //         name: name,
      //         emailAddress: email,
      //         dob: dob,
      //         gender: gender,
      //         isStudent: isStudent,
      //       },
      //     );
      //     console.log(response.data);

      //     createUserWithEmailAndPassword(auth, email, password)
      //       .then(userCredentials => {
      //         const user = userCredentials.user;
      //         console.log('Registered with:', user.email);
      //         navigation.navigate("ChooseSubscriptionScreen");
      //       })
      //       .catch(error => alert(error.message))
      //   }
      //   catch (error) {
      //     console.log(error);
      //   }
      // } 
      // else { 
      //   // Form is invalid, display error messages 
      //   console.log('Form has errors. Please correct them.'); 
      // }

      // if (isFormValid) {
      //   navigation.navigate("ChooseSubscriptionScreen");
      // }

      navigation.navigate("ChooseSubscriptionScreen");

    };

    const handleGoBack = () => {
      navigation.navigate("OnboardingScreen");
    };
  
    return(
        <ImageBackground
            source={AppImages.onboarding_bg}
            style={styles.bgContainer}
        >
          <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : 'height'}>
            <ScrollView showsVerticalScrollIndicator={false}>
                <View style={styles.container} behavior="padding">
                    <View style={styles.header_conatiner}>
                      <TouchableOpacity onPress={handleGoBack}>
                        <Image style={styles.image} source={AppImages.arrow_left} />
                      </TouchableOpacity>
                      <Text style={styles.header}>Signup</Text>
                    </View>
                    <View style={styles.input_fields_container}>
                        <Text style={{fontFamily: "Sora-Regular", color:AppColors.secondaryColor, fontSize: 22}}>
                          Enter your details
                        </Text>
                        <View style={styles.input_field_container}>
                        <Text style={styles.input_field_name}>
                            Name
                        </Text>
                        <TextInput 
                            style={styles.input_field} 
                            placeholder={"Enter your name"}
                            value={name}
                            onChangeText={text => setName(text)}
                        />
                        <Text style={styles.error_msg}>
                            {errors.name}
                        </Text>
                        </View>
                        <View style={styles.input_field_container}>
                        <Text style={styles.input_field_name}>
                            Email ID
                        </Text>
                        <TextInput 
                            style={styles.input_field}
                            placeholder={"Enter your Email ID"}
                            value={email}
                            onChangeText={text => setEmail(text)}
                        />
                        <Text style={styles.error_msg}>
                            {errors.email}
                        </Text>
                        </View>
                        <View style={styles.input_field_container}>
                        <Text style={styles.input_field_name}>
                            Date of Birth
                        </Text>
                        <TextInput 
                            style={styles.input_field}
                            placeholder={"format: DD/MM/YYYY e.x. 21/03/2000"}
                            value={dob}
                            onChangeText={text => setDob(text)}
                        />
                        <Text style={styles.error_msg}>
                            {errors.dob}
                        </Text>
                        </View>
                        <View style={styles.input_field_container}>
                        <Text style={styles.input_field_name}>
                            Gender
                        </Text>
                        <RNPickerSelect
                          placeholder={genderPlaceholder}
                          items={genderOptions}
                          onValueChange={(value) => setGender(value)}
                          value={gender}
                          style={{...pickerSelectStyles}}
                        />
                        <Text style={styles.error_msg}>
                            {errors.gender}
                        </Text>
                        </View>
                        <View style={styles.input_field_container}>
                        <Text style={styles.input_field_name}>
                            Password
                        </Text>
                        <TextInput 
                            style={styles.input_field} 
                            placeholder={"Enter your Password"}
                            value={password}
                            onChangeText={text => setPassword(text)}
                            secureTextEntry
                        />
                        <Text style={styles.error_msg}>
                            {errors.password}
                        </Text>
                        </View>
                        <View style={styles.input_field_container}>
                        <Text style={styles.input_field_name}>
                            Confirm Password
                        </Text>
                        <TextInput 
                            style={styles.input_field} 
                            placeholder={"Re-enter your Password"}
                            value={confirmPassword}
                            onChangeText={text => setConfirmPassword(text)}
                            secureTextEntry
                            />
                        <Text style={styles.error_msg}>
                            {errors.confirmPassword}
                        </Text>
                        </View>
                        <View style={styles.switch_container}>
                        <Text style={styles.switch_text}>I am a Student</Text>
                        <Switch
                            trackColor={{false: '#767577', true: AppColors.secondaryColor}}
                            thumbColor={isStudent ? '#ffffff' : '#f4f3f4'}
                            ios_backgroundColor="#3e3e3e"
                            onValueChange={toggleSwitch}
                            value={isStudent}
                        />
                        </View>
                    </View>
                    
                    <TouchableOpacity 
                        style={[styles.button_container, { opacity: isFormValid ? 1 : 0.5 }]} 
                        // disabled={!isFormValid}
                        onPress={handleSignUp}
                    >
                        <Text style={styles.button_text}>Signup</Text>
                    </TouchableOpacity>
                </View>
            </ScrollView>
          </KeyboardAvoidingView>
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
        display: "flex",
        flexDirection: "column",
        justifyContent: "flex-start",
        alignItems: "flex-start",
        marginTop: 80,
        paddingHorizontal: 16,
        rowGap: 32,
    },
    header_conatiner: {
      display: "flex",
      flexDirection: "row",
      justifyContent: "flex-start",
      alignItems: "center",
      columnGap: 96,
    },
    image: {
      width: 32,
      height: 32,
    },
    header: {
      fontFamily: "Sora-SemiBold",
      fontSize: 24,
      color: AppColors.secondaryColor,
    },
    input_fields_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "flex-start",
        alignItems: "flex-start",
        boxSizing: "border-box",
        rowGap: 16,
    },
    input_field_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "flex-start",
        alignItems: "flex-start",
        boxSizing: "border-box",
        rowGap: 8,
    },
    input_field_name: {
        fontSize: 18,
        marginRight: 8,
        fontFamily: "Sora-Regular",
    },
    input_field: {
        backgroundColor: "white",
        width: width * 0.9,
        height: 48,
        padding: 10,
        borderRadius: 10,
    },
    switch_container :{
        display: "flex",
        flexDirection: "row",
        justifyContent: "flex-start",
        alignItems: "center",
    },
    switch_text :{
        flex: 1,
        fontFamily: "Sora-Regular",
        fontSize: 18,
    },
    button_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        paddingHorizontal: 16,
        backgroundColor: AppColors.buttonColor,
        height: 56,
        width: width*0.6,
        borderRadius: 45,
        alignSelf:"center",
        marginBottom: 56,
    },
    button_text: {
      fontSize: 20,
      fontFamily: "Sora-Regular",
      color: "white",
    },
    error_msg: {
      fontFamily: "Sora-Regular",
      fontSize: 12,
      color: AppColors.red,
      opacity: 0.5,
    },
  });

  const pickerSelectStyles = StyleSheet.create({
    inputIOS: {
        // borderWidth: 1,
        // borderColor: 'gray',
        // borderRadius: 4,
        // paddingVertical: 12,
        // paddingHorizontal: 10,
        width: width * 0.8,
        fontSize: 18,
        fontFamily: "Sora-Regular",
        color: "gray",
    //   paddingRight: 30, // to ensure the text is never behind the icon
    },
    inputAndroid: {
        paddingHorizontal: 10,
        paddingVertical: 8,
        width: width * 0.9,
        fontSize: 18,
        fontFamily: "Sora-Regular",
        color: "gray",
    //   paddingRight: 30, // to ensure the text is never behind the icon
    },
  });
  
  export default SignupView;