import { React, useState, useEffect } from "react";
import { View, Text, TouchableOpacity, TextInput, Image, ImageBackground, StyleSheet, Dimensions, ScrollView, KeyboardAvoidingView, Platform } from "react-native";

import { AppColors } from "../../utils/AppColors";
import { AppImages } from "../../utils/AppImages";
import { ip } from "../../utils/IP";


import { useNavigation } from "@react-navigation/native";

const { width } = Dimensions.get("window");

import { auth } from "../../../firebaseConfig";

import axios from "axios";

import RNPickerSelect from 'react-native-picker-select';

const AddCustomSubscriptionView = () => {
    
    const navigation = useNavigation();

    const [email, setEmail] = useState(null);
    
    useEffect(() => {
        const unsubscribe = auth.onAuthStateChanged((user) => {
            if (user) {
                console.log('User in onAuthState function:', user.email); // Log the user object
                setEmail(user.email);
            } else {
                console.log('No user signed in');
            }
        }, (error) => {
            console.log('Authentication error:', error); // Log authentication errors
        });
      
        // Clean up subscription
        return unsubscribe;

    }, [])

    //form validation
    const [subscriptionName, setSubscriptionName] = useState(null);
    const [subscriptionPlanName, setSubscriptionPlanName] = useState(null);
    const [type, setType] = useState(null);
    const [category, setCategory] = useState(null);
    const [price, setPrice] = useState(null);
    const [dueDate, setDueDate] = useState(null);
    const [frequency, setFrequency] = useState(" ");

    const [frequencyRequired, setFrequencyRequired] = useState(true);

    const typePlaceholder = {
        label: 'Click to select the type...',
        value: null,
    };
    
    const typeOptions = [
        { label: 'Free Trial', value: 'Free Trial' },
        { label: 'Paid', value: 'Paid' },
    ];

    const frequencyPlaceholder = {
        label: 'Click to select the type...',
        value: null,
    };
    
    const frequencyOptions = [
        { label: 'Monthly', value: 'Free Trial' },
        { label: 'Weekly', value: 'Weekly' },
        { label: 'Bi-Weekly', value: 'Bi-Weekly' },
        { label: 'Every 3 months', value: 'Every 3 months' },
        { label: 'Every 6 months', value: '6 months' },
        { label: 'Yearly', value: 'Paid' },
    ];

    const [errors, setErrors] = useState({}); 
    const [isFormValid, setIsFormValid] = useState(false);

    useEffect(() => { 
        validateForm(); 
    }, [subscriptionName, subscriptionPlanName, price, dueDate, frequency]); 
    
    const validateForm = () => { 
        let errors = {}; 

        if (!subscriptionName) { 
            errors.subscriptionName = 'Subscription name is required!'; 
        } else if (!/^[A-Za-z]+(?:\s+[A-Za-z]+)*/.test(subscriptionName)) {
            errors.subscriptionName = 'Subscription name can contain only alphabets.' ;
        }

        if (!subscriptionPlanName) { 
            errors.subscriptionPlanName = 'Plan name is required!'; 
        } else if (!/^[A-Za-z]+(?:\s+[A-Za-z]+)*/.test(subscriptionName)) {
            errors.subscriptionPlanName = 'Subscription plan name can contain only alphabets.' ;
        }

        if (!category) { 
            errors.category = 'Plan name is required!'; 
        } else if (!/^[A-Za-z]+(?:\s+[A-Za-z]+)*/.test(category)) {
            errors.category = 'Category can contain only alphabets.' ;
        }

        if (!price) { 
            errors.price = 'Price of the plan is required!'; 
        } else if (!/^\d+(\.\d+)?$/.test(price)) {
            errors.price = 'Price can be only in digits';
        }
        
        if (!dueDate) { 
            errors.dueDate = 'Due Date is required!'; 
        } else if (!/^(0[1-9]|1[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/20(1[0-9]|2[0-5])/.test(dueDate)) {
            errors.dueDate = 'Date format is incorrect';
          }
        
        if (type === "Paid"){
            if (!frequency) { 
                errors.frequency = 'Frequency is required!'; 
            }
        }

        // Set the errors and update form validity 
        setErrors(errors); 
        setIsFormValid(Object.keys(errors).length === 0); 
    };

    const handleAddCustomSubscription = async () => {

        if (isFormValid) {
            try {
                const response = await axios.post(
                    `http://${ip}:8080/subscription/custom`,
                    {
                      emailAddress: email,
                      serviceName: subscriptionName,
                      type: type,
                      endDate: dueDate,
                      planName: subscriptionPlanName,
                      paymentFrequency: frequency,
                      price: price,
                    },
                  );
                  console.log(response.data);
            }
            catch (error) {
                console.log(error.message);
            }
            navigation.navigate("ChooseSubscriptionScreen");
        }

    }

    const handleGoBack = () => {
        navigation.navigate("ChooseSubscriptionScreen");
    };  

    return(
        <ImageBackground
            source={AppImages.onboarding_bg}
            style={styles.bgContainer}
        >
            <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : 'height'}>
                <ScrollView showsVerticalScrollIndicator={false}>
                    <View style={styles.container}>
                        <View style={styles.header_conatiner}>
                        <TouchableOpacity onPress={handleGoBack}>
                            <Image style={styles.image} source={AppImages.arrow_left} />
                        </TouchableOpacity>
                        <Text style={styles.header}>Add Subscription</Text>
                        </View>
                        <View style={styles.input_fields_container}>
                            <Text style={{fontFamily: "Sora-Regular", color: AppColors.secondaryColor, fontSize: 22}}>
                                Enter subscription details
                            </Text>
                            <View style={styles.input_field_container}>
                                <Text style={styles.input_field_name}>
                                    Subscription Name
                                </Text>
                                <TextInput 
                                    style={styles.input_field} 
                                    placeholder={"Enter name of the subscription"}
                                    value={subscriptionName}
                                    onChangeText={text => setSubscriptionName(text)}
                                />
                                <Text style={styles.error_msg}>
                                    {errors.subscriptionName}
                                </Text>
                            </View>
                            <View style={styles.input_field_container}>
                                <Text style={styles.input_field_name}>
                                    Plan Name
                                </Text>
                                <TextInput 
                                    style={styles.input_field} 
                                    placeholder={"Enter name of the plan"}
                                    value={subscriptionPlanName}
                                    onChangeText={text => setSubscriptionPlanName(text)}
                                />
                                <Text style={styles.error_msg}>
                                    {errors.subscriptionPlanName}
                                </Text>
                            </View>
                            <View style={styles.input_field_container}>
                                <Text style={styles.input_field_name}>
                                    Category
                                </Text>
                                <TextInput 
                                    style={styles.input_field} 
                                    placeholder={"Enter category of subscription"}
                                    value={category}
                                    onChangeText={text => setCategory(text)}
                                />
                                <Text style={styles.error_msg}>
                                    {errors.subscriptionPlanName}
                                </Text>
                            </View>
                            <View style={styles.input_field_container}>
                                <Text style={styles.input_field_name}>
                                    Type
                                </Text>
                                <RNPickerSelect
                                    placeholder={typePlaceholder}
                                    items={typeOptions}
                                    onValueChange={(value) => setType(value)}
                                    value={type}
                                    style={{...pickerSelectStyles}}
                                />
                            </View>
                            <View style={styles.input_field_container}>
                                <Text style={styles.input_field_name}>
                                    Price
                                </Text>
                                <TextInput 
                                    style={styles.input_field} 
                                    placeholder={"Enter price of the plan (in Dhs.)"}
                                    value={price}
                                    onChangeText={text => setPrice(text)}
                                />
                                <Text style={styles.error_msg}>
                                    {errors.price}
                                </Text>
                            </View>
                            <View style={styles.input_field_container}>
                                <Text style={styles.input_field_name}>
                                    Due Date
                                </Text>
                                <TextInput 
                                    style={styles.input_field} 
                                    placeholder={"format: DD/MM/YYYY e.x. 29/02/204"}
                                    value={dueDate}
                                    onChangeText={text => setDueDate(text)}
                                />
                                <Text style={styles.error_msg}>
                                    {errors.dueDate}
                                </Text>
                            </View>
                            {   type === "Paid" &&
                            <View style={styles.input_field_container}>
                                <Text style={styles.input_field_name}>
                                    Fequency
                                </Text>
                                <RNPickerSelect
                                    placeholder={frequencyPlaceholder}
                                    items={frequencyOptions}
                                    onValueChange={(value) => setFrequency(value)}
                                    value={frequency}
                                    style={{...pickerSelectStyles}}
                                />
                            </View>
                            }
                        </View>
                        <TouchableOpacity 
                            style={[styles.button_container, { opacity: isFormValid ? 1 : 0.5 }]} 
                            disabled={!isFormValid}
                            onPress={handleAddCustomSubscription}
                        >
                            <Text style={styles.button_text}>Add</Text>
                        </TouchableOpacity>
                    </View>
                </ScrollView>
            </KeyboardAvoidingView>
        </ImageBackground>
    )
}

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
        rowGap: 32,
        marginTop: 80,
    },
    header_conatiner: {
        display: "flex",
        flexDirection: "row",
        justifyContent: "space-between",
        alignItems: "center",
        columnGap: 24,
        paddingHorizontal: 16,
    },
    header: {
        fontFamily: "Sora-SemiBold",
        fontSize: 24,
        color: AppColors.secondaryColor,
        paddingHorizontal: 16,
    },
    image: {
        width: 32,
        height: 32,
    },
    input_fields_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "flex-start",
        alignItems: "flex-start",
        boxSizing: "border-box",
        paddingHorizontal: 16,
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
        fontFamily: "Sora-Regular",
        marginRight: 8,
        fontSize: 18,
    },
    input_field: {
        backgroundColor: "white",
        height: 48,
        width: width * 0.9,
        padding: 10,
        borderRadius: 10,
        // borderColor: AppColors.black,
        // borderWidth: 1,
    },
    button_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        alignSelf:"center",
        backgroundColor: AppColors.buttonColor,
        paddingHorizontal: 16,
        height: 56,
        width: width*0.6,
        borderRadius: 45,
        marginBottom: 24,
    },
    button_text: {
        fontFamily: "Sora-Regular",
        fontSize: 20,
        color: "white",
    },
    error_msg: {
        fontFamily: "Sora-Regular",
        fontSize: 12,
        color: AppColors.red,
        opacity: 0.5,
    },
})

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

export default AddCustomSubscriptionView;