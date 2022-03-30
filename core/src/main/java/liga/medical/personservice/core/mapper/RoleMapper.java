package liga.medical.personservice.core.mapper;

import liga.medical.personservice.core.model.Role;
import liga.medical.personservice.dto.RoleDto;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class RoleMapper {

    ModelMapper modelMapper = MappingUtils.modelMapper();

    public RoleDto toDto (Role role){
        return Objects.isNull(role) ? null : modelMapper.map(role, RoleDto.class);
    }

    public Role toEntity (RoleDto roleDto){
        return Objects.isNull(roleDto) ? null : modelMapper.map(roleDto, Role.class);
    }
}
