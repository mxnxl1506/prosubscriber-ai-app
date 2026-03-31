import React from "react";
import { View, Text, Modal, StyleSheet, TouchableOpacity } from "react-native";
import { AppColors } from "../utils/AppColors";

const ConfirmationPopup = ({ title, onPressYes, onPressCancel, isVisible }) => {
  return (
    <Modal visible={isVisible} transparent>
      <View style={styles.container}>
        <View style={styles.popup}>
          <Text style={styles.text}>{title}</Text>
          <View style={{ flexDirection: "row", gap: 8, marginTop: 24, alignSelf: "center" }}>
            <TouchableOpacity onPress={onPressCancel} style={styles.button}>
              <Text style={styles.buttonText}>Cancel</Text>
            </TouchableOpacity>
            <TouchableOpacity
              onPress={onPressYes}
              style={[
                styles.button,
                { backgroundColor: AppColors.buttonColor },
              ]}
            >
              <Text
                style={[
                  styles.buttonText,
                  {
                    color: "white",
                  },
                ]}
              >
                Yes
              </Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    </Modal>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "rgba(0, 0, 0, 0.5)",
  },
  popup: {
    backgroundColor: "white",
    paddingHorizontal: 16,
    paddingVertical: 32,
    borderRadius: 32,
    elevation: 5,
    width: "80%",
  },
  text: {
    fontSize: 22,
    color: "black",
    textAlign: "center",
    width: "80%",
    alignSelf: "center",
    fontFamily: "Sora-Regular",
  },
  button: {
    padding: 10,
    borderRadius: 50,
    // marginVertical: 10,
    width: "50%",
    alignItems: "center",
    borderWidth: 2,
    borderColor: AppColors.buttonColor,
  },
  buttonText: {
    color: "black",
    fontSize: 18,
    fontFamily: "Sora-Regular",
  },
});

export default ConfirmationPopup;
