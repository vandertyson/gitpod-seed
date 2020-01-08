package com.mycompany.benchmark.mqtt;

import java.util.UUID;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;

public class Utils {

    public static MqttClient newConnection(String brokerURL) throws MqttException{
        String publisherId = UUID.randomUUID().toString();
        MqttClient publisher = new MqttClient(brokerURL, publisherId);

        MqttConnectOptions options = new MqttConnectOptions();
        options.setAutomaticReconnect(true);
        options.setCleanSession(true);
        options.setConnectionTimeout(10);    
        publisher.connect(options);        
        return publisher;
    }
}