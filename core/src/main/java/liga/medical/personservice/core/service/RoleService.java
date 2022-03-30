package liga.medical.personservice.core.service;

import liga.medical.personservice.core.mapper.RoleMapper;
import liga.medical.personservice.core.model.Role;
import liga.medical.personservice.core.repository.RoleRepository;
import liga.medical.personservice.dto.RoleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {

    RoleRepository roleRepository;
    RoleMapper modelMapper;

    @Autowired
    public RoleService(RoleRepository roleRepository, RoleMapper modelMapper) {
        this.roleRepository = roleRepository;
        this.modelMapper = modelMapper;
    }

    public RoleDto getRoleById (Long id){
        return modelMapper.toDto(roleRepository.findById(id));
    }

    public void saveRole (String roleName){
        roleRepository.saveRole(roleName);
    }


    public Role findRoleEntityByName (String name){
        return roleRepository.findEntityByName(name);
    }
}
