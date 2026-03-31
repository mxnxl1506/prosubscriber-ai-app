import React from "react";
import { useState, useEffect } from "react";
import {
  View,
  Text,
  ImageBackground,
  StyleSheet,
  Image,
  FlatList,
  Pressable,
  TouchableOpacity,
} from "react-native";
import { AppImages } from "../../utils/AppImages";

import Header from "../../components/Header";
import HomeMenuButtons from "../../components/HomeMenuButtons";

import { useNavigation } from "@react-navigation/native";

import fetchLogo from "../../../hooks/fetchLogo";

const SubscriptionListView = (props) => {

  const navigation = useNavigation();

  const RenderCard = ({ item }) => {
    const imagePath = fetchLogo(item.serviceName);
    return (
      <TouchableOpacity
        onPress={() => navigation.navigate("SubscriptionDetailScreen", {
          subscription: item,
        })}
        style={styles.card}
      >
        <Image source={imagePath} style={styles.cardImage} />

        <View style={{ gap: 5 }}>
          <Text style={styles.cardText}>{item.serviceName}</Text>
          <Text style={[styles.cardText, { fontSize: 18 }]}>{item.price} Dhs. - {item.paymentFrequency}</Text>
          <Text style={[styles.cardText, { fontSize: 16,  color: "gray" }]}>
            Next due: {item.endDate}
          </Text>
        </View>
      </TouchableOpacity>
    );
  };

  return (
    <ImageBackground
      source={AppImages.onboarding_bg}
      style={styles.bgContainer}
    >
      <View style={styles.container}>
        <Header title="My Subscriptions" />
        <FlatList
          data={props.subscriptions}
          // renderItem={renderCard}
          renderItem={({item}) => 
              <RenderCard 
                  item={item}
              />
            }
          keyExtractor={item => item.serviceName}
          showsVerticalScrollIndicator={false}
          style={{ marginTop: 32, flex: 1 }}
          // keyExtractor={(item, index) => index.toString()}
        />
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
  card: {
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: "rgba(255, 255, 255, 0.5)",
    padding: 16,
    borderRadius: 16,
    marginBottom: 16,
    columnGap: 16,
  },
  cardImage: {
    height: 64,
    width: 64,
    resizeMode: "contain",
  },
  cardText: {
    fontSize: 20,
    fontFamily: "Sora-Regular",
    color: "black",
  },
});

export default SubscriptionListView;
