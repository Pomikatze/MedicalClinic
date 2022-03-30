package liga.medical.personservice.core.mapper;

import liga.medical.personservice.core.model.ContactEntity;
import liga.medical.personservice.dto.ContactDto;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class ContactMapper {

    ModelMapper modelMapper = MappingUtils.modelMapper();

    public ContactDto toDto (ContactEntity contactEntity) {
        return Objects.isNull(contactEntity) ? null : modelMapper.map(contactEntity, ContactDto.class);
    }

    public ContactEntity toEntity (ContactDto contactDto) {
        return Objects.isNull(contactDto) ? null : modelMapper.map(contactDto, ContactEntity.class);
    }
}
