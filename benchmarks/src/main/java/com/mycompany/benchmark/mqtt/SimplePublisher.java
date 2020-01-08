package com.mycompany.benchmark.mqtt;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Random;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.MqttPersistenceException;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.TearDown;
import org.openjdk.jmh.annotations.Threads;

public class SimplePublisher {

    @State(Scope.Thread)
    public static class SingleConnection {
        @Param({ "128" })
        public int payloadSize;

        @Param({ "0", })
        public int qos;

        @Param({ "true" })
        public boolean retained;      

        public byte[] payload;

        public String topic;

        public MqttClient client;    

        @Setup(Level.Trial)
        public void setupConnection() throws Exception {
            String brokerURI = System.getProperty("broker", "localhost:1883");
            client = Utils.newConnection(brokerURI);
            payload = new byte[payloadSize];
            new Random().nextBytes(payload);
            topic = System.getProperty("topic", "/topic/anhct23");
        }

        @TearDown(Level.Trial)
        public void closeConnection() throws Exception {
            // client.disconnect();
            // client.close();
        }
    }

    @Benchmark    
    public void sendSingleConnection(SingleConnection state) throws MqttPersistenceException, MqttException {
        MqttMessage msg = new MqttMessage(state.payload);
        msg.setQos(state.qos);
        msg.setRetained(state.retained);        
        state.client.publish(state.topic, msg);
    }
}
