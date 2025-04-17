package com.ayush.hr_portal.service;

import com.ayush.hr_portal.model.HR;
import com.ayush.hr_portal.repository.HRRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HRService {
    @Autowired
    private HRRepository hrRepository;

    public boolean authenticate(String email, String password) {
        HR hr = hrRepository.findByEmailAndPassword(email, password);
        return hr != null;
    }
}