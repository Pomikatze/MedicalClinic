package liga.medical;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PatientDto {

    private String name;

    private Integer age;

    private String address;

    private LocalDateTime birthdayDt;

    private String registration;

    private String passportSeries;

    private String passportNumber;

    private String phoneNumber;

    private int medicalHistory;

}
