package liga.medical;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MedicalHistoryDto {

    private int patient;

    private String docNumber;

    private OffsetDateTime createDttm;

    private OffsetDateTime modifyDttm;

    private String doctor;

    private String diagnosis;

    private List<Integer> medicalHistory;
}
