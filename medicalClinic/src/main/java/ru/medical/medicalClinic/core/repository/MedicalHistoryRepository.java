package ru.medical.medicalClinic.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.medical.medicalClinic.core.model.entity.MedicalHistory;

public interface MedicalHistoryRepository extends JpaRepository<MedicalHistory, Long> {
}
