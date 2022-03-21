package liga.medical.personservice.core.mapper;

import liga.medical.personservice.core.model.IllnessEntity;
import liga.medical.personservice.dto.IllnessDto;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class IllnessMapper {

    ModelMapper modelMapper = MappingUtils.modelMapper();

    public IllnessDto toDto (IllnessEntity illnessEntity){
        return Objects.isNull(illnessEntity) ? null : modelMapper.map(illnessEntity, IllnessDto.class);
    }

    public IllnessEntity toEntity (IllnessDto illnessDto){
        return Objects.isNull(illnessDto) ? null : modelMapper.map(illnessDto, IllnessEntity.class);
    }
}
