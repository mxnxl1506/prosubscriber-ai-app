import React from "react";
import { View, Text, StyleSheet, Image, Pressable } from "react-native";
import { AppImages } from "../utils/AppImages";
import { AppColors } from "../utils/AppColors";
import { useNavigation } from "@react-navigation/native";

const Header = (props) => {
  const navigation = useNavigation();
  return (
    <View style={styles.container}>
      {props.backIcon ? (
        <Pressable onPress={() => navigation.goBack()}>
          <Image source={AppImages.arrow_left} style={styles.arrow_left} />
        </Pressable>
      ) : (
        <View style={styles.arrow_left} />
      )}
      <Text style={styles.text}>{props.title}</Text>
      {/* <Pressable onPress={() => navigation.navigate("ProfileScreen")}>
        <Image source={AppImages.avatar} style={styles.avatar} />
      </Pressable> */}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    // flexDirection: "row",
    // justifyContent: "space-between",
    alignItems: "center",
    paddingHorizontal: 8,
    marginTop: 40,
  },
  avatar: {
    width: 50,
    height: 50,
    borderRadius: 20,
  },
  text: {
    fontFamily: "Sora-SemiBold",
    fontSize: 24,
    color: AppColors.secondaryColor,
  },
  arrow_left: {
    width: 32,
    height: 32,
  },
});
export default Header;
