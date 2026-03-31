import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { useFonts } from "expo-font";

import OnboardingScreen from "./src/screens/onboarding/OnboardingScreen";
import HomeScreen from "./src/screens/appflow/HomeScreen";
import SubscriptionListScreen from "./src/screens/appflow/SubscriptionListScreen";
import SubscriptionDetailScreen from "./src/screens/appflow/SubscriptionDetailScreen";
import RecommendationListScreen from "./src/screens/appflow/RecommendationListScreen";
import RecommendationDetailScreen from "./src/screens/appflow/RecommendationDetailScreen";
import TransactionScreen from "./src/screens/appflow/TransactionScreen";
import ProfileScreen from "./src/screens/appflow/ProfileScreen";
import SplashScreen from "./src/screens/SplashScreen";
import LaunchScreen from "./src/views/onboarding/LaunchScreen";

import SignupScreen from "./src/screens/signup/SignupScreen";
import ChooseSubscriptionScreen from "./src/screens/subscription/ChooseSubscriptionScreen";
import AddSubscriptionScreen from "./src/screens/subscription/AddSubscriptionScreen";
import AddCustomSubscriptionScreen from "./src/screens/subscription/AddCustomSubcriptionScreen";

const Stack = createNativeStackNavigator();

export default function App() {
  const [fontsLoaded, fontError] = useFonts({
    "Sora-Bold": require("./assets/fonts/Sora-Bold.ttf"),
    "Sora-Regular": require("./assets/fonts/Sora-Regular.ttf"),
    "Sora-SemiBold": require("./assets/fonts/Sora-SemiBold.ttf"),
  });

  if (!fontsLoaded && !fontError) {
    return null;
  }
  return (
    <NavigationContainer>
      <Stack.Navigator screenOptions={{ headerShown: false }}>
        {/* <Stack.Screen name="SplashScreen" component={SplashScreen} /> */}
        <Stack.Screen name="LaunchScreen" component={LaunchScreen} />
        <Stack.Screen name="OnboardingScreen" component={OnboardingScreen} />
        <Stack.Screen name="SignupScreen" component={SignupScreen} />
        {/* <Stack.Screen name="ConsentScreen" component={ConsentView} /> */}
        <Stack.Screen name="ChooseSubscriptionScreen" component={ChooseSubscriptionScreen} />
        <Stack.Screen name="AddSubscriptionScreen" component={AddSubscriptionScreen} />
        <Stack.Screen name="AddCustomSubscriptionScreen" component={AddCustomSubscriptionScreen} />
        <Stack.Screen name="HomeScreen" component={HomeScreen} />
        <Stack.Screen name="SubscriptionListScreen" component={SubscriptionListScreen}/>
        <Stack.Screen name="SubscriptionDetailScreen" component={SubscriptionDetailScreen}/>
        <Stack.Screen name="RecommendationListScreen" component={RecommendationListScreen}/>
        <Stack.Screen name="RecommendationDetailScreen" component={RecommendationDetailScreen}/>
        <Stack.Screen name="TransactionScreen" component={TransactionScreen} />
        <Stack.Screen name="ProfileScreen" component={ProfileScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});