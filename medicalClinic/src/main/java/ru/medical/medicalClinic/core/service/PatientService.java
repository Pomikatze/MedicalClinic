package ru.medical.medicalClinic.core.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.medical.medicalClinic.core.model.entity.PatientEntity;
import ru.medical.medicalClinic.core.repository.PatientRepository;

import java.util.List;

@Service
public class PatientService{
    private PatientRepository patientRepository;

    @Autowired
    public PatientService(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    public PatientEntity findById (Long id){
        return patientRepository.findById(id).get();
    }

    public List<PatientEntity> findAll (){
        return patientRepository.findAll();
    }

    public void saveOrUpdate (PatientEntity patientEntity){
        patientRepository.saveAndFlush(patientEntity);
    }

    public void deletePatient (Long id){
        patientRepository.deleteById(id);
    }
}
