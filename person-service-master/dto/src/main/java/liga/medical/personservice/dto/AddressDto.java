package liga.medical.personservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddressDto {

    @NotBlank
    private Long contactId;

    @NotBlank
    private Long countryId;

    @NotBlank
    private String city;

    @NotBlank
    private String street;

    @NotBlank
    private String building;
}
