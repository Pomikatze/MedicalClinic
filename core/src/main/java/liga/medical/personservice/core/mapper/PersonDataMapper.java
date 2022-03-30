package liga.medical.personservice.core.mapper;

import liga.medical.personservice.core.model.PersonDataEntity;
import liga.medical.personservice.dto.PersonDataDto;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class PersonDataMapper {

    ModelMapper modelMapper = MappingUtils.modelMapper();

    public PersonDataDto toDto (PersonDataEntity personDataEntity){
        return Objects.isNull(personDataEntity) ? null : modelMapper.map(personDataEntity, PersonDataDto.class);
    }

    public PersonDataEntity toEntity (PersonDataDto personDataDto){
        return Objects.isNull(personDataDto) ? null : modelMapper.map(personDataDto, PersonDataEntity.class);
    }
}
