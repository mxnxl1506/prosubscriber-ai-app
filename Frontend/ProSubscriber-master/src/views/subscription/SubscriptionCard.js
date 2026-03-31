import React from "react";
import { View, Text, TouchableOpacity, Image, StyleSheet, Dimensions } from "react-native";

import { AppImages } from "../../utils/AppImages";

import { useNavigation } from "@react-navigation/native";

const { height, width } = Dimensions.get("window");

import fetchLogo from "../../../hooks/fetchLogo";

const SubscriptionCard = ({item}) => {

    const navigation = useNavigation();

    const imagePath = fetchLogo(item.serviceName);

    return(
        <TouchableOpacity style={styles.container} onPress={
            () => navigation.navigate("AddSubscriptionScreen", {
            serviceName: item.serviceName,
          })}>
            <Image 
                source={imagePath}
                style={styles.logo}
            />
            <Text style={styles.app_name}>
                {item.serviceName}
            </Text>
            <TouchableOpacity onPress={
                () => navigation.navigate("AddSubscriptionScreen", {
                    // serviceName: "Netflix",
                    serviceName: item.serviceName,
                })
            }>
                <Image
                    source={AppImages.plus_blue}
                    style={{height: 32, width: 32}}
                />
            </TouchableOpacity>
        </TouchableOpacity>
    );
};

const styles = StyleSheet.create({
    container: {
        display: "flex",
        flexDirection: "row",
        justifyContent: "flex-start",
        alignItems: "center",
        columnGap: 16,
        padding: 8,
        borderRadius: 8,
        backgroundColor: "rgba(255, 255, 255, 0.5)",
        width: width * 0.9,
    }, 
    logo: {
        width: 56,
        height: 56,
        resizeMode: "contain",
        borderRadius: 8,
    },
    app_name: {
        flex: 1,
        fontFamily: "Sora-Regular",
        fontSize: 16,
    },
})

export default SubscriptionCard;