package ru.medical.medicalClinic.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.medical.medicalClinic.core.model.entity.PatientEntity;

public interface PatientRepository extends JpaRepository<PatientEntity, Long> {
}
