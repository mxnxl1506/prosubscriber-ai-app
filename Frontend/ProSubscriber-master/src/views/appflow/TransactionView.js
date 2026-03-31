import React from "react";
import {
  View,
  Text,
  ImageBackground,
  StyleSheet,
  Image,
  Dimensions,
  FlatList,
} from "react-native";

import { AppColors } from "../../utils/AppColors";
import { AppImages } from "../../utils/AppImages";

import Header from "../../components/Header";
import HomeMenuButtons from "../../components/HomeMenuButtons";

import { BarChart, LineChart } from "react-native-chart-kit";

import { useNavigation } from "@react-navigation/native";

import fetchLogo from "../../../hooks/fetchLogo";

const { width: screenWidth, height } = Dimensions.get("window");

const TransactionView = (props) => {
  
  const navigation = useNavigation();

  // const dateLabels = [];

  // for (let i=0; i<transactions.length; i++){

  // }

  // console.log(new Date().toDateString());

  const data = {
    labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
    datasets: [
      {
        data: [20, 45, 28, 80, 99, 43, 11, 12, 13, 14, 15, 16],
      },
    ],
  };

  const chartConfig = {
    backgroundGradientFrom: "#FFFFFF",
    backgroundGradientFromOpacity: 1,
    backgroundGradientTo: "#FFFFFF",
    backgroundGradientToOpacity: 1,
    color: (opacity = 1) => `rgba(0, 0, 0, ${opacity})`,
    strokeWidth: 2,
    barPercentage: 0.5,
    useShadowColorFromDataset: false,
  };

  const RenderCard = ({ item }) => {
    const imagePath = fetchLogo(item.serviceName);
    return (
      <View
        onPress={() => navigation.navigate("SubscriptionDetailScreen")}
        style={styles.card}
      >
        <Image source={imagePath} style={styles.cardImage} />

        <View style={{ gap: 6 }}>
          <Text style={styles.cardText}>{item.serviceName}</Text>
          <Text style={[styles.cardText, { fontSize: 18 }]}>Amount Paid: {item.amountPaid} Dhs.</Text>
          <Text style={[styles.cardText, { fontSize: 16, color: "gray" }]}>
            Payment date: {item.datePaid}
          </Text>
        </View>
      </View>
    );
  };
  return (
    <ImageBackground
      source={AppImages.onboarding_bg}
      style={styles.bgContainer}
    >
      <View style={styles.container}>
        <Header title="Transactions" />
        <FlatList
          data={props.transactions}
          showsVerticalScrollIndicator={false}
          style={{ marginTop: 32, flex: 1 }}
          renderItem={({item}) => 
              <RenderCard 
                  item={item}
              />
          }
          keyExtractor={item => item.serviceName}
          // contentContainerStyle={{marginBottom: 108}}
          // ListHeaderComponent={
          //   <View>
          //     <BarChart
          //       style={{
          //         backgroundColor: "white",
          //         borderRadius: 10,
          //         paddingBottom: 10,
          //         marginTop: 20,
          //       }}
          //       data={data}
          //       width={screenWidth - 40}
          //       height={height * 0.4}
          //       yAxisLabel="$"
          //       chartConfig={chartConfig}
          //       verticalLabelRotation={30}
          //       showBarTops={false}
          //     />
          //     <Text style={styles.title}>Past transactions</Text>
          //   </View>
          // }
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
  boldText: {
    fontSize: 24,
    fontFamily: "Sora-Regular",
    color: AppColors.secondaryColor,
    marginTop: 20,
  },
  title: {
    fontSize: 22,
    fontFamily: "Sora-SemiBold",
    color: AppColors.secondaryColor,
    marginTop: 32,
    marginBottom: 24,
  },
  text: {
    fontSize: 18,
    color: "#1E1E24",
    fontFamily: "Sora-Regular",
  },
  card: {
    flexDirection: "row",
    alignItems: "center",
    padding: 16,
    marginBottom: 8,
    columnGap: 16,
    borderBottomWidth: 1,
    borderColor: "gray"
  },
  cardImage: {
    height: 64,
    width: 64,
  },
  cardText: {
    fontSize: 20,
    fontFamily: "Sora-Regular",
    color: "black",
  },
});

export default TransactionView;
