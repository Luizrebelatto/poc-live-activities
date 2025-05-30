import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View, TouchableOpacity, NativeModules } from 'react-native';

export default function App() {
  const { LiveActivities } = NativeModules

  function handleStartActivities(){
    LiveActivities.startActivity();
  }

  function handleUpdateActivities(){
    LiveActivities.updateActivity();
  }

  function handleendActivities(){
    LiveActivities.endActivity();
  }
  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.button} onPress={handleStartActivities}>
        <Text style={styles.textButton}>Start</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button} onPress={handleUpdateActivities}>
        <Text style={styles.textButton}>Update</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button} onPress={handleendActivities}>
        <Text style={styles.textButton}>End</Text>
      </TouchableOpacity>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  textButton: {
    color: 'white',
    fontSize: 16,
    fontWeight: 'bold'
  },
  button: {
    width: 150,
    height: 40,
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 10,
    backgroundColor: 'blue',
    marginTop: 10
  }
});
