import React from "react";
import {
  View,
  Text,
  StyleSheet,
  Image,
  Dimensions,
  Pressable,
  Modal,
  TouchableOpacity,
} from "react-native";
import { AppImages } from "../utils/AppImages";
import { useNavigation } from "@react-navigation/native";
import { AppColors } from "../utils/AppColors";
import { Entypo } from "@expo/vector-icons";

const HomeMenuButtons = ({ bgWhite }) => {
  const navigation = useNavigation();
  const [modalVisible, setModalVisible] = React.useState(false);

  const navigationFunction = (screen) => {
    navigation.navigate(screen);
    setModalVisible(false);
  };
  return (
    <View style={styles.container}>
      <Pressable onPress={() => navigation.navigate("HomeScreen")}>
        <Image
          source={bgWhite ? AppImages.homewhite_button : AppImages.home_button}
          style={styles.menu_button}
        />
      </Pressable>
      <Pressable onPress={() => setModalVisible(true)}>
        <Image source={AppImages.menu_button} style={styles.menu_button} />
      </Pressable>
      <Modal animationType="slide" transparent={true} visible={modalVisible}>
        <View style={styles.modalContainer}>
          <View style={styles.modalView}>
            <TouchableOpacity
              onPress={() => navigationFunction("HomeScreen")}
            >
              <Text style={styles.textStyle}>Home</Text>
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => navigationFunction("SubscriptionListScreen")}
            >
              <Text style={styles.textStyle}>My Subscriptions</Text>
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => navigationFunction("RecommendationListScreen")}
            >
              <Text style={styles.textStyle}>Recommendations</Text>
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => navigationFunction("TransactionScreen")}
            >
              <Text style={styles.textStyle}>Transactions</Text>
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => navigationFunction("ProfileScreen")}
            >
              <Text style={styles.textStyle}>Profile</Text>
            </TouchableOpacity>
            <TouchableOpacity
              style={{ alignItems: "flex-end", width: "100%" }}
              onPress={() => setModalVisible(false)}
            >
              {/* <Entypo
                name="circle-with-cross"
                size={60}
                color="white"
              /> */}
              <Image
                source={AppImages.menu_close_button}
                style={{height: 64, width: 64}}
              />
            </TouchableOpacity>
          </View>
        </View>
      </Modal>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    position: "absolute",
    bottom: Dimensions.get("window").height * 0.05,
    right: 20,
    flexDirection: "row",
    gap: 10,
  },
  menu_button: {
    height: 80,
    width: 80,
  },
  modalContainer: {
    flex: 1,
    justifyContent: "flex-end",
    alignItems: "center",
    backgroundColor: "rgba(0, 0, 0, 0.5)",
  },
  modalView: {
    borderTopRightRadius: 48,
    borderTopLeftRadius: 48,
    width: "100%",
    padding: 32,
    elevation: 5,
    backgroundColor: AppColors.secondaryColor,
    alignItems: "center",
    rowGap: 16,
  },
  textStyle: {
    color: "white",
    fontFamily: "Sora-SemiBold",
    textAlign: "center",
    fontSize: 24,
  },
});

export default HomeMenuButtons;
