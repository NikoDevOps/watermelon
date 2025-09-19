package com.example.watermelon;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class WatermelonController {

    @Value("${app.version:v3}")
    private String version;

    @GetMapping("/hello")
    public Map<String, String> hello() {
        return Map.of(
                "message", "Hello from Watermelon!!!!!",
                "version", version
                "some", "text"
        );
    }
}