package medicalClinic.core.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@Entity
@Table (name = "medical_history")
public class MedicalHistory {
    @Id
    @Column (name = "id")
    private Long id;

    @OneToOne
    @JoinColumn(name = "patient_id", nullable = false)
    private PatientEntity patient;

    @Column(name = "doc_number", nullable = false, unique = true)
    private String docNumber;

    @CreationTimestamp
    @Column(name = "create_dttm", nullable = false)
    private LocalDateTime createDttm;

    @UpdateTimestamp
    @Column(name = "modify_dttm", nullable = false)
    private LocalDateTime modifyDttm;

    @Column(name = "doctor", nullable = false)
    private String doctor;

    @Column(name = "diagnosis")
    private String diagnosis;

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private MedicalHistory medicalHistory;

    public MedicalHistory(Long id, PatientEntity patient, String docNumber, LocalDateTime createDttm, LocalDateTime modifyDttm, String doctor, String diagnosis, MedicalHistory medicalHistory) {
        this.id = id;
        this.patient = patient;
        this.docNumber = docNumber;
        this.createDttm = createDttm;
        this.modifyDttm = modifyDttm;
        this.doctor = doctor;
        this.diagnosis = diagnosis;
        this.medicalHistory = medicalHistory;
    }
}
