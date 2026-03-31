import React, { useState, useEffect } from "react";
import ProfileView from "../../views/appflow/ProfileView";


import { auth } from "../../../firebaseConfig";

import { useNavigation } from "@react-navigation/native";

import axios from "axios";

const ProfileScreen = () => {

  const navigation = useNavigation();

  const [isVisible, setIsVisible] = useState("");

  const onPressYes = () => {
    setIsVisible("");
    auth
      .signOut()
      .then(() => {
        navigation.replace("LaunchScreen");
      })
      .catch(error => alert(error.message));
  };

  const onPressCancel = () => {
    setIsVisible("");
  };

  const onPressDelete = () => {
    setIsVisible("Are you sure you want to delete profile?");
  };

  const onPressLogout = () => {
    setIsVisible("Are you sure you want to logout?");
  };

    return (
      <ProfileView
        isVisible={isVisible}
        onPressCancel={onPressCancel}
        onPressYes={onPressYes}
        onPressDelete={onPressDelete}
        onPressLogout={onPressLogout}
      />
    );
};

export default ProfileScreen;
