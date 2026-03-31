import React from "react";
import { View, Text, FlatList, Image, TouchableOpacity, ImageBackground, StyleSheet, Dimensions, ScrollView } from "react-native";

import { AppImages } from "../../utils/AppImages";
import { AppColors } from "../../utils/AppColors";

import SubscriptionCard from "./SubscriptionCard";

import { useNavigation } from "@react-navigation/native";

const { height, width } = Dimensions.get("window");

const ChooseSubcriptionView = ({subscriptionServices}) => {

    console.log(subscriptionServices);

    const navigation = useNavigation();

    return(
        <ImageBackground
            source={AppImages.onboarding_bg}
            style={styles.bgContainer}
        >
            <View style={styles.wrap_container}>
                <View style={styles.header_container}>
                    <Text style={styles.header}>Choose Subscription</Text>
                </View>
                <View style={styles.container}>
                    <FlatList
                        data={subscriptionServices}
                        renderItem={({item}) => 
                            <SubscriptionCard 
                                item={item}
                            />
                        }
                        keyExtractor={item => item.serviceName}
                        contentContainerStyle={styles.subscriptions_conatiner}
                        showsVerticalScrollIndicator={false}
                    />                        
                    <TouchableOpacity 
                        style={styles.button_container} 
                        onPress={() => navigation.navigate("HomeScreen")}
                    >
                        <Text style={styles.button_text}>Done</Text>
                    </TouchableOpacity>
                </View>
                <TouchableOpacity style={styles.add_subscription_button} onPress={() => navigation.navigate("AddCustomSubscriptionScreen")}>
                    <Text style={styles.add_subscription_text}>Add Custom Subscription</Text>
                </TouchableOpacity>
            </View>
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
    wrap_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        rowGap: 32,
    },
    header_container: {
        alignSelf: "flex-start",
        marginTop: 80,
        paddingHorizontal: 16,
    },
    header: {
        fontFamily: "Sora-SemiBold",
        fontSize: 24,
        color: AppColors.secondaryColor,
    },
    container: {
        flex: 1,
        display: "flex",
        flexDirection: "column",
        justifyContent: "flex-start",
        alignItems: "flex-start",
        rowGap: 32,
    },
    subscriptions_conatiner: {
        // flex: 1,
        rowGap: 16,
    },
    button_container: {
        justifyContent: "center",
        alignItems: "center",
        alignSelf:"center",
        backgroundColor: AppColors.buttonColor,
        paddingHorizontal: 16,
        height: height * 0.06,
        width: width * 0.6,
        borderRadius: 45,
        height: 56,
    },
    button_text: {
        fontSize: 20,
        fontFamily: "Sora-Regular",
        color: "white",
    },
    add_subscription_button: {
        display: "flex",
        flexDirection: "row",
        justifyContent: "center",
        alignItems: "center",
        alignSelf: "center",
        backgroundColor: "white",
        height: height * 0.11,
        width: width,
        paddingVertical: 8,
        columnGap: 16,
    },
    add_subscription_text: {
        fontFamily: "Sora-Regular",
        fontSize: 20,
        color: AppColors.secondaryColor,
        // textAlign: "center",
    }
})

export default ChooseSubcriptionView;