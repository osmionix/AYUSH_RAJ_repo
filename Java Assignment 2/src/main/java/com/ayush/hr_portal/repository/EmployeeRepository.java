package com.ayush.hr_portal.repository;

import com.ayush.hr_portal.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}