import React from "react";
import { useState, useEffect } from "react";
import { View, Text, TextInput, Image, ScrollView, ImageBackground, StyleSheet, TouchableOpacity, Dimensions } from "react-native";

import { AppColors } from "../../utils/AppColors";
import { AppImages } from "../../utils/AppImages";
import { ip } from "../../utils/IP";


import { useNavigation } from "@react-navigation/native";

import RNPickerSelect from 'react-native-picker-select';

// import { onAuthStateChanged } from "firebase/auth";

import { auth } from "../../../firebaseConfig";

import axios from "axios";

const { width } = Dimensions.get("window");

const AddSubscriptionView = (props) => {

    console.log("inside view", props.subscriptionPlans)

    const subscription = props.subscriptionPlans;
    
    const navigation = useNavigation();
    
    const [subscriptionName, setSubscriptionName] = useState('');
    const [type, setType] = useState(null);
    const [subscriptionPlanName, setSubscriptionPlanName] = useState('');
    const [price, setPrice] = useState('');
    const [dueDate, setDueDate] = useState('');
    const [frequency, setFrequency] = useState('');

    const [planOptions, setPlanOptions] = useState([]);
    console.log(planOptions);
    
    const populatePlanOptions = () => {
        try {
            const temp = []
            if(subscription) {
                console.log("inside plan options");
                for (let i = 0; i < subscription.length; i++) {
                    console.log(subscription[i].planName)
                    temp.push({
                        label: subscription[i].planName,
                        value: subscription[i].planName
                    })
                };
                console.log(temp);
                setPlanOptions(temp);
            }
        }
        catch (error) {
            console.log("not working");
        }
    }

    const [email, setEmail] = useState(null);
    
    useEffect(() => {
        setSubscriptionName(subscription[0].serviceName);
        console.log("inside use effect", subscription);
        populatePlanOptions();

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
    
    const [errors, setErrors] = useState({}); 
    const [isFormValid, setIsFormValid] = useState(false);

    const validateForm = () => { 
        let errors = {}; 
  
        if (!dueDate) {
          errors.dueDate = 'Due Date is required.';
        } else if (!/\b\d{2}\/\d{2}\/\d{4}\b/.test(dueDate)) {
          errors.dueDate = 'Date format is incorrect';
        }
    
        // Set the errors and update form validity 
        setErrors(errors); 
        setIsFormValid(Object.keys(errors).length === 0); 
    };

    useEffect(() => { 
        validateForm(); 
    }, [dueDate]);

    const [frequencyRequired, setFrequencyRequired] = useState(true);
    
    const placeholder = {
        label: 'Click to select the plan...',
        value: null,
    };

    const typePlaceholder = {
        label: 'Click to select the type...',
        value: null,
    };
    
    const typeOptions = [
        { label: 'Free Trial', value: 'Free Trial' },
        { label: 'Paid', value: 'Paid' },
    ];
    
    const updateInformation = () => {
        if(subscriptionPlanName != null) {
            for (let i = 0; i < subscription.length; i++) {
                var subscriptionPlan = subscription[i];
                if (subscriptionPlan.planName == subscriptionPlanName) {
                    setPrice(subscriptionPlan.price);
                    setFrequency(subscriptionPlan.paymentFrequency);
                }
            };
        }
        else {
            setPrice(null);
            setFrequency(null);
        }
    };

    useEffect(() => {
        updateInformation();
    }, [subscriptionPlanName])

    const handleAddSubscription = async () => {
        
        if (isFormValid) {
            try {
                const response = await axios.post(
                    `http://${ip}:8080/subscription`,
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
                console.log(error);
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
            <View style={styles.container}>
                <View style={styles.header_conatiner}>
                    <TouchableOpacity onPress={handleGoBack}>
                        <Image style={styles.image} source={AppImages.arrow_left} />
                    </TouchableOpacity>
                    <Text style={styles.header}>Add Subscription</Text>
                </View>
                <ScrollView showsVerticalScrollIndicator={false}>
                    <View style={styles.fields_container}>
                        <Text style={{fontFamily: "Sora-Regular", color: AppColors.secondaryColor, fontSize: 22}}>
                            Enter subscription details
                        </Text>
                        <View style={styles.field_container}>
                            <Text style={styles.label}>Name</Text>
                            <View style={styles.value_container}>
                                <Text style={styles.value}>{subscriptionName}</Text>
                            </View>
                        </View>
                        <View style={styles.field_container}>
                            <Text style={styles.label}>Type</Text>
                        </View>
                        <View style={{marginLeft: 8}}>
                            <RNPickerSelect
                                placeholder={typePlaceholder}
                                items={typeOptions}
                                onValueChange={(value) => setType(value)}
                                value={type}
                                style={{...pickerSelectStyles}}
                            />
                        </View>
                        <View style={styles.field_container}>
                            <Text style={styles.label}>Plan</Text>
                        </View>
                        <View style={{marginLeft: 8}}>
                            <RNPickerSelect
                                placeholder={placeholder}
                                items={planOptions}
                                onValueChange={(value) => setSubscriptionPlanName(value)}
                                value={subscriptionPlanName}
                                style={{...pickerSelectStyles}}
                            />
                        </View>
                        <View style={styles.field_container}>
                            <Text style={styles.label}>Price</Text>
                            <View style={styles.value_container}>
                                <Text style={styles.value}>{price}</Text>
                            </View>
                        </View>
                        <View style={styles.field_container}>
                            <Text style={styles.label}>
                                Due Date
                            </Text>
                            <TextInput 
                                style={styles.input_field} 
                                placeholder={"format: DD/MM/YYYY e.x. 21/03/2000"}
                                value={dueDate}
                                onChangeText={text => setDueDate(text)}
                            />
                            <Text style={styles.error_msg}>
                                {errors.dueDate}
                            </Text>
                        </View>
                        {   type === "Paid" &&
                            <View style={[styles.field_container, {opacity: frequencyRequired? 1: 0}]}>
                                <Text style={styles.label}>Frequency</Text>
                                <View style={styles.value_container}>
                                    <Text style={styles.value}>{frequency}</Text>
                                </View>
                            </View>
                        }
                    </View>
                    <TouchableOpacity 
                        style={[styles.button_container, { opacity: isFormValid ? 1 : 0.5 }]} 
                        onPress={handleAddSubscription}
                        disabled={!isFormValid}
                    >
                        <Text style={styles.button_text}>Add</Text>
                    </TouchableOpacity>
                </ScrollView>
            </View>
        </ImageBackground>
    )
}

const styles = StyleSheet.create({
    bgContainer: {
        flex: 1,
        justifyContent: "flex-start",
        alignItems: "flex-start",
        height: "100%",
        width: "100%",
    },
    container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "flex-start",
        paddingHorizontal: 16,
        rowGap: 32,
        marginTop: 80,
    },
    header_conatiner: {
        display: "flex",
        flexDirection: "row",
        justifyContent: "flex-start",
        alignItems: "center",
        columnGap: 40,
    },
    header: {
        alignSelf: "flex-start",
        fontSize: 24,
        fontFamily: "Sora-SemiBold",
        color: AppColors.secondaryColor,
    },
    image: {
        height: 32,
        width: 32,
    },
    fields_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "flex-start",
        alignItems: "flex-start",
        boxSizing: "border-box",
        rowGap: 16,
    },
    input_field: {
        padding: 10,
        height: 48,
        width: width * 0.9,
        borderRadius: 8,
        // borderColor: AppColors.black,
        // borderWidth: 1,
        fontSize: 16,
        fontFamily: "Sora-Regular",
        backgroundColor: "white",
    },
    field_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "flex-start",
        alignItems: "flex-start",
        boxSizing: "border-box",
        rowGap: 8,
    },
    value_container: {
        padding: 8,
    },
    value: {
        fontSize: 18,
        fontFamily: "Sora-Regular",
        color: "gray",
    },
    label: {
        fontSize: 18,
        fontFamily: "Sora-Regular",
    },
    button_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        alignSelf:"center",
        paddingHorizontal: 16,
        borderRadius: 45,
        height: 48,
        width: width * 0.6,
        marginTop: 24,
        marginBottom: 24,
        backgroundColor: AppColors.buttonColor,
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

export default AddSubscriptionView;