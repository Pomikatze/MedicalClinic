package medicalClinic.core.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.medical.medicalClinic.core.model.entity.MedicalHistory;
import medicalClinic.core.repository.MedicalHistoryRepository;

import java.util.List;

@Service
public class MedicalHistoryService {
    private MedicalHistoryRepository medicalHistoryRepository;

    @Autowired
    public MedicalHistoryService(MedicalHistoryRepository medicalHistoryRepository) {
        this.medicalHistoryRepository = medicalHistoryRepository;
    }

    public MedicalHistory findById (Long id){
        return medicalHistoryRepository.findById(id).get();
    }

    public List<MedicalHistory> findAll (){
        return medicalHistoryRepository.findAll();
    }

    public void saveOrUpdate (MedicalHistory medicalHistory){
        medicalHistoryRepository.saveAndFlush(medicalHistory);
    }

    public void deletePatient (Long id){
        medicalHistoryRepository.deleteById(id);
    }
}
