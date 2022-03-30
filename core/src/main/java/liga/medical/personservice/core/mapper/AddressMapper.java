package liga.medical.personservice.core.mapper;

import liga.medical.personservice.core.model.AddressEntity;
import liga.medical.personservice.dto.AddressDto;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class AddressMapper {

    ModelMapper modelMapper = MappingUtils.modelMapper();

    public AddressDto toDto (AddressEntity addressEntity){
        return Objects.isNull(addressEntity) ? null : modelMapper.map(addressEntity, AddressDto.class);
    }

    public AddressEntity toEntity (AddressDto addressDto){
        return Objects.isNull(addressDto) ? null : modelMapper.map(addressDto, AddressEntity.class);
    }
}
