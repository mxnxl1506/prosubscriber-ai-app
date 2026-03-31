import React from "react";
import { useEffect } from "react";
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

const RecommendationListView = (props) => {
  
  const recommendations = props.recommendations;

  console.log("inside view: ", recommendations);
  
  const streaming = [];
  const music = [];
  const food = [];
  const utilities = [];
  const education = [];
  
  const setCategory = () => {
    try {
      if (recommendations) {
        console.log("length of recommendations array inside set category view", recommendations.length)
        for (let i=0; i<recommendations.length; i++) {
          if (recommendations[i].category == 'Streaming') {
            streaming.push(recommendations[i]);
          }
          else if (recommendations[i].category == 'Music') {
            music.push(recommendations[i]);
          }
          else if (recommendations[i].category == 'Food') {
            food.push(recommendations[i]);
          }
          else if (recommendations[i].category == 'Utilities') {
            utilities.push(recommendations[i]);
          }
          else if (recommendations[i].category == 'Education') {
            education.push(recommendations[i]);
          }
        }
      }
    }
    catch (error) {
      console.log(error);
    }
  }

  useEffect(() => {
    setCategory();
  }, []);

  // console.log("streaming array", streaming);

  const navigation = useNavigation();

  const MyRecommendationsCard = ({ item }) => {
    const imagePath = fetchLogo(item.serviceName);
    return (
      <TouchableOpacity
        onPress={() => navigation.navigate("RecommendationDetailScreen", {
          recommendation: item,
        })}
        style={styles.recommendationCard}
      >
        <Image
          source={imagePath}
          style={styles.recommendationImage}
        />
        <Text style={styles.recommendationText}>
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
      <View style={styles.container}>
        <Header title="My Recommendations" />
      <ScrollView style={{marginTop: 32}}>
        <Text style={styles.boldText}>Streaming</Text>
        <FlatList 
          data={streaming}
          renderItem={({item}) => 
              <MyRecommendationsCard 
                  item={item}
              />
            }
          keyExtractor={item => item.serviceName}
          horizontal
          showsHorizontalScrollIndicator={false}
          // style={{ marginVertical: 16 }}
          contentContainerStyle={styles.horizontal_container}
        />
        <Text style={styles.boldText}>Music</Text>
        <FlatList 
          data={music}
          renderItem={({item}) => 
              <MyRecommendationsCard 
                  item={item}
              />
          }
          keyExtractor={item => item.serviceName}
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.horizontal_container}
        />
        <Text style={styles.boldText}>Food</Text>
        <FlatList 
          data={food}
          renderItem={({item}) => 
              <MyRecommendationsCard 
                  item={item}
              />
          }
          keyExtractor={item => item.serviceName}
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.horizontal_container}
        />
        <Text style={styles.boldText}>Education</Text>
        <FlatList 
          data={education}
          renderItem={({item}) => 
              <MyRecommendationsCard 
                  item={item}
              />
          }
          keyExtractor={item => item.serviceName}
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.horizontal_container}          
        />
        <Text style={styles.boldText}>Utilities</Text>
        <FlatList 
          data={utilities}
          renderItem={({item}) => 
              <MyRecommendationsCard 
                  item={item}
              />
          }
          keyExtractor={item => item.serviceName}
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.horizontal_container}
        />
      </ScrollView>
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
    flex: 1,
    // marginBottom: 96,
  },
  horizontal_container: {
    alignItems: "center",
    marginHorizontal: 16,
    marginTop: 8,
    marginBottom: 16,
  },
  boldText: {
    fontSize: 20,
    fontFamily: "Sora-Bold",
    color: AppColors.secondaryColor,
    marginLeft: 16,
  },
  recommendationCard: {
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: "rgba(255, 255, 255, 0.5)",
    padding: 16,
    borderRadius: 16,
    marginRight: 16,
    width: width * 0.7,
    columnGap: 8,
  },
  recommendationImage: {
    width: 64,
    height: 64,
    marginRight: 20,
    resizeMode: "contain",
  },
  recommendationText: {
    flex: 1,
    flexWrap: "wrap",
    fontSize: 20,
    fontFamily: "Sora-Regular",
    color: "black",
    textAlign: "center",
  },
});

export default RecommendationListView;
