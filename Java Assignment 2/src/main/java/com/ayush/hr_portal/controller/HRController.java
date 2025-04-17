package com.ayush.hr_portal.controller;

import com.ayush.hr_portal.service.HRService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/hr")
public class HRController {
    @Autowired
    private HRService hrService;

    @PostMapping("/login")
    public ResponseEntity<Boolean> login(@RequestParam String email, @RequestParam String password) {
        boolean isAuthenticated = hrService.authenticate(email, password);
        return ResponseEntity.ok(isAuthenticated);
    }
}