package liga.medical.personservice.core.service;

import liga.medical.personservice.core.mapper.PersonDataMapper;
import liga.medical.personservice.core.model.Role;
import liga.medical.personservice.core.repository.PersonDataRepository;
import liga.medical.personservice.dto.PersonDataDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PersonDataService implements UserDetailsService {

    PersonDataRepository personDataRepository;
    PersonDataMapper modelMapper;

    @Autowired
    public PersonDataService(PersonDataRepository personDataRepository, PersonDataMapper modelMapper) {
        this.personDataRepository = personDataRepository;
        this.modelMapper = modelMapper;
    }

    public PersonDataDto findById (Long id){
        return modelMapper.toDto(personDataRepository.findById(id));
    }

    public List<PersonDataDto> findAll (){
        return personDataRepository.findAll().stream()
                .map(al -> modelMapper.toDto(al)).collect(Collectors.toList());
    }

    public PersonDataDto savePersonData (PersonDataDto personDataDto){
        personDataRepository.insert(modelMapper.toEntity(personDataDto));
        return personDataDto;
    }

    public Boolean deleteById (Long id){
        return personDataRepository.deleteById(id);
    }

    public void setRoleByEmail (String email, Long role){
        personDataRepository.setRoleByEmail(role, email);
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return personDataRepository.findPersonByEmail(email);
    }
}
