package org.misha;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/")
public class ApacheKafkaWebController {
    private final KafkaSender kafkaSender;

    public ApacheKafkaWebController(final KafkaSender kafkaSender) {
        this.kafkaSender = kafkaSender;
    }

    @GetMapping(value = "/producer")
    public String producer(@RequestParam("message") String message) {
        try {
            kafkaSender.send(message);
            return "Message sent to the Kafka Topic java_in_use_topic Successfully: " + message;
        } catch (Throwable e) {
            return e.getMessage();
        }
    }
}
