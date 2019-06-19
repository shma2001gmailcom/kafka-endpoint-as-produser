package org.misha;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class KafkaSender {
    private static final String kafkaTopic = "java_in_use_topic";
    private final KafkaTemplate<String, String> kafkaTemplate;

    public KafkaSender(final KafkaTemplate<String, String> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    void send(String message) {
        kafkaTemplate.send(kafkaTopic, message);
    }
}
