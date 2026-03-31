import React from "react";
import { TouchableOpacity, View, Text, ImageBackground, StyleSheet, Dimensions } from "react-native";

import { AppImages } from "../../utils/AppImages";
import { AppColors } from "../../utils/AppColors";

import { useNavigation } from "@react-navigation/native";

const { width } = Dimensions.get("window");

const ConsentView = () => {

    const navigation = useNavigation();

    return(
        <ImageBackground
            source={AppImages.onboarding_bg}
            style={styles.bgContainer}
        >
            <View style={styles.container}>
                <Text style={styles.text}>Do you wanna know how much youre actually making use of those subscriptions? Kindly give us usage access so you can be sure that youre not paying for an app you don't use.</Text>
                <TouchableOpacity 
                    style={styles.button_container} 
                    onPress={() => navigation.navigate("ChooseSubscriptionScreen")}
                >
                    <Text style={styles.button_text}>Yes, I do.</Text>
                </TouchableOpacity>
                <TouchableOpacity 
                    style={[styles.button_container, { backgroundColor: "white", borderWidth: 2, borderColor: AppColors.buttonColor}]} 
                    onPress={() => navigation.navigate("ChooseSubscriptionScreen")}
                >
                    <Text style={[styles.button_text, {color: "black"}]}>No, I don't.</Text>
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
    container: {
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
    },
    text: {
        fontFamily: "Sora-Regular",
        fontSize: 18,
    },
    button_container: {
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        alignSelf: "center",
        backgroundColor: AppColors.buttonColor,
        paddingHorizontal: 16,
        height: 48,
        width: width*0.6,
        borderRadius: 45,
        marginBottom: 24,
    },
    button_text: {
        fontFamily: "Sora-Regular",
        fontSize: 20,
        color: "white",
    },
})

export default ConsentView;