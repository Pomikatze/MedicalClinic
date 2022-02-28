package ru.medical.medicalClinic.core.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import ru.medical.medicalClinic.core.model.entity.MedicalHistory;
import ru.medical.medicalClinic.core.service.MedicalHistoryService;

import java.util.List;

@RestController
@RequestMapping("/api/v1/history")
public class MedicalHistoryController {
    MedicalHistoryService medicalHistoryService;

    @Autowired
    public MedicalHistoryController(MedicalHistoryService medicalHistoryService) {
        this.medicalHistoryService = medicalHistoryService;
    }

    @GetMapping("/{id}")
    public MedicalHistory findById (@PathVariable Long id){
        return medicalHistoryService.findById(id);
    }

    @GetMapping
    public List<MedicalHistory> findAll (){
        return medicalHistoryService.findAll();
    }

    @PutMapping
    public MedicalHistory savePatient (@RequestBody MedicalHistory medicalHistory){
        medicalHistoryService.saveOrUpdate(medicalHistory);
        return medicalHistory;
    }

    @DeleteMapping("/{id}")
    public int deleteMedicalHistory (@PathVariable Long id){
        medicalHistoryService.deletePatient(id);
        return HttpStatus.OK.value();
    }
}
