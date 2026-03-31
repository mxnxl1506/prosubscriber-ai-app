import React from "react";
import {
  View,
  Text,
  ImageBackground,
  StyleSheet,
  Image,
  FlatList,
  Dimensions,
  TouchableOpacity,
  Pressable,
  ScrollView,
} from "react-native";

import { AppImages } from "../../utils/AppImages";
import { AppColors } from "../../utils/AppColors";

import Header from "../../components/Header";
import HomeMenuButtons from "../../components/HomeMenuButtons";

import { useNavigation } from "@react-navigation/native";

import fetchLogo from "../../../hooks/fetchLogo";

const { height, width } = Dimensions.get("window");

const HomeView = (prop) => {

  const subscriptions = prop.subscriptions;
  const recommendations = prop.recommendations;

  // subscriptions = subscriptions.slice(0,5);
  // recommendations = recommendations.slice(0,5);
  
  const navigation = useNavigation();
  
  const MySubscriptionsCard = ({ item }) => {
    // const imagePath = appImageMap[item.serviceName] || null;
    const imagePath = fetchLogo(item.serviceName);
    return (
      <TouchableOpacity style={styles.subscriptionCard} 
        onPress={() => navigation.navigate("SubscriptionDetailScreen", {
          subscription: item,
        })}
      >
        <View style={styles.cardRow}>
          <Image source={imagePath} style={styles.logo} />
          <Text style={[styles.card_text, {flexWrap: 'wrap'}]}>{item.serviceName}</Text>
        </View>
        <Text style={[styles.card_text, { fontSize: 18 }]}>{item.price} Dhs.- {item.paymentFrequency}</Text>
        <Text style={[styles.card_text, { fontSize: 16 }]}>Next due: {item.endDate}</Text>
      </TouchableOpacity>
    );
  };

  const MyRecommendationsCard = ({ item }) => {
    // const imagePath = appImageMap[item.serviceName] || null;
    const imagePath = fetchLogo(item.serviceName);
    return (
      <TouchableOpacity style={styles.recommendationCard} 
        onPress={() => navigation.navigate("RecommendationDetailScreen", {
          recommendation: item,
        })}
      >
        <Image
          source={imagePath}
          style={styles.logo}
        />
        <Text style={[styles.card_text, {flex: 1}]}>
          {item.serviceName}
        </Text>
      </TouchableOpacity>
    );
  };
  
  return (
    <ImageBackground
      source={AppImages.onboarding_bg}
      style={styles.bgContainer}
    >
      <ScrollView>
        <View style={styles.container}>
          <Header title="Home" />
          <View style={styles.sectionHeaderview}>
            <Text style={styles.boldText}>My Subscriptions</Text>
            <Pressable
              onPress={() => navigation.navigate("SubscriptionListScreen")}
            >
              <Image source={AppImages.arrow_left} style={styles.arrow_right} />
            </Pressable>
          </View>
          <FlatList
            data={subscriptions}
            renderItem={({item}) => 
              <MySubscriptionsCard 
                  item={item}
              />
            }
            keyExtractor={item => item.serviceName}
            horizontal
            showsHorizontalScrollIndicator={false}
            contentContainerStyle={{ alignItems: "center", paddingHorizontal: 16 }}
          />
          <View style={{ marginTop: 20 }}>
            <Text style={[styles.boldText, {paddingHorizontal: 16}]}>My Recommedations</Text>
            <FlatList
              data={recommendations}
              horizontal
              style={{ marginTop: 20 }}
              showsHorizontalScrollIndicator={false}
              contentContainerStyle={{ alignItems: "center", paddingHorizontal: 16 }}
              renderItem={({item}) => 
                <MyRecommendationsCard 
                    item={item}
                />
              }
              keyExtractor={item => item.serviceName}
            />
            <View style={styles.buttonView}>
              <TouchableOpacity
                onPress={() => navigation.navigate("RecommendationListScreen")}
                style={styles.button}
              >
                <Text style={styles.buttonText}>View All</Text>
                <Image source={AppImages.arrow_right} style={styles.arrow} />
              </TouchableOpacity>
            </View>
            <View style={styles.buttonView}>
              <TouchableOpacity
                onPress={() => navigation.navigate("ChooseSubscriptionScreen")}
                style={[styles.button, {width: width * 0.7, borderWidth: 2, borderColor: AppColors.buttonColor, backgroundColor: "white", alignSelf: "center"}]}
              >
                <Text style={[styles.buttonText, {color: "black"}]}>Add subscription</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </ScrollView>
      <HomeMenuButtons />
    </ImageBackground>
  );
};

const styles = StyleSheet.create({
  bgContainer: {
    flex: 1,
    height: "100%",
    width: "100%",
  },
  arrow_right: {
    width: 40,
    height: 40,
    transform: [{ rotate: "180deg" }],
  },
  sectionHeaderview: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    marginVertical: 20,
    paddingHorizontal: 16,
  },
  boldText: {
    fontSize: 22,
    fontFamily: "Sora-SemiBold",
    color: AppColors.secondaryColor,
  },
  subscriptionCard: {
    flexDirection: "column",
    justifyContent: "center",
    alignItems: "center",
    rowGap: 12,
    backgroundColor: "rgba(255, 255, 255, 0.5)",
    paddingHorizontal: 16,
    paddingVertical: 24,
    borderRadius: 16,
    width: width * 0.7,
    marginRight: 15,
  },
  cardRow: {
    flexDirection: "row",
    alignItems: "center",
    width: "100%",
    justifyContent: "center",
    paddingHorizontal: 16,
    columnGap: 16,
  },
  card_text: {
    flexWrap: 'wrap',
    fontFamily: "Sora-Regular",
    color: "black",
    fontSize: 20,
    textAlign: "center",
  },
  recommendationCard: {
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: "rgba(255, 255, 255, 0.5)",
    padding: 16,
    borderRadius: 16,
    width: width * 0.7,
    columnGap: 16,
    // elevation: 7,
    marginRight: 16,
  },
  logo: {
    width: 64,
    height: 64,
    resizeMode: "contain",
    borderRadius: 8,
  },
  button: {
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    columnGap: 8,
    backgroundColor: AppColors.buttonColor,
    // paddingVertical: 8,
    paddingHorizontal: 16,
    borderRadius: 46,
    width: width * 0.5,
    height: height * 0.06,
    height: 56,
  },
  buttonText: {
    fontFamily: "Sora-Regular",
    fontSize: 20,
    color: "white",
  },
  arrow: {
    width: 32,
    height: 32,
  },
  buttonView: {
    alignItems: "flex-end",
    width: "100%",
    marginTop: 16,
    paddingHorizontal: 16,
  },
});

export default HomeView;
