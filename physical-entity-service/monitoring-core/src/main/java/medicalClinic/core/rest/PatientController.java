package medicalClinic.core.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import medicalClinic.core.entity.PatientEntity;
import medicalClinic.core.service.PatientService;

import java.util.List;

@RestController
@RequestMapping ("/api/v1/patient")
public class PatientController {
    PatientService patientService;

    @Autowired
    public PatientController(PatientService patientService) {
        this.patientService = patientService;
    }

    @GetMapping("/{id}")
    public PatientEntity findById (@PathVariable Long id){
        return patientService.findById(id);
    }

    @GetMapping
    public List<PatientEntity> findAll (){
        return patientService.findAll();
    }

    @PutMapping
    public PatientEntity savePatient (@RequestBody PatientEntity patient){
        patientService.saveOrUpdate(patient);
        return patient;
    }

    @DeleteMapping("/{id}")
    public int deletePatient (@PathVariable Long id){
        patientService.deletePatient(id);
        return HttpStatus.OK.value();
    }
}
