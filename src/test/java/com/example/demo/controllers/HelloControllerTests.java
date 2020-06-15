package com.example.demo.controllers;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;

public class HelloControllerTests {
    @InjectMocks
    private HelloController controller;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void indexTest(){
        assertTrue(controller.index().equals("Greetings from Spring Boot!"));
    }
}