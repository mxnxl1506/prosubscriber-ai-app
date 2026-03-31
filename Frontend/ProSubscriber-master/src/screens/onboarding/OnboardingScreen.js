import React, { useState } from "react";
import OnBoardingView from "../../views/onboarding/OnBoardingView";
import { useNavigation } from "@react-navigation/native";

const OnboardingScreen = () => {
  const navigation = useNavigation();
  const [screenIndex, setScreenIndex] = useState(0);

  const onPressNext = () => {
    setScreenIndex(screenIndex + 1);
  };

  const onPressContinue = () => {
    navigation.navigate("HomeScreen");
  };
  return (
    <OnBoardingView
      screenIndex={screenIndex}
      onPressNext={onPressNext}
      onPressContinue={onPressContinue}
    />
  );
};

export default OnboardingScreen;
