package liga.medical;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * dto содержит информацию для экстренного уведомления о состоянии пациента
 */

@Data
@NoArgsConstructor
public class AlertDto {

    private Long patientId;

    private String patientName;

    private String doctor;

    private String diagnosis;

    //todo: доступ к истории пациента
//    private MedicalHistory history;
}
