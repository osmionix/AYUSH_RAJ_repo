package com.ayush.hr_portal.repository;

import com.ayush.hr_portal.model.HR;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HRRepository extends JpaRepository<HR, Long> {
    HR findByEmailAndPassword(String email, String password);
}