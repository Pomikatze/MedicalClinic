package liga.medical.personservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IllnessDto {

    @NotBlank
    private Long medicalCardId;

    private Long typeId;

    private char heaviness;

    @NotBlank
    private LocalDateTime appearanceDttm;

    private LocalDate recoveryDate;
}
