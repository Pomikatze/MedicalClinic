package liga.medical.personservice.core.service;

import liga.medical.personservice.core.mapper.ContactMapper;
import liga.medical.personservice.core.model.ContactEntity;
import liga.medical.personservice.core.repository.ContactRepository;
import liga.medical.personservice.dto.ContactDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ContactService {

    ContactRepository contactRepository;
    ContactMapper modelMapper;

    @Autowired
    public ContactService(ContactRepository contactRepository, ContactMapper modelMapper) {
        this.contactRepository = contactRepository;
        this.modelMapper = modelMapper;
    }

    public ContactDto saveNewContact(ContactDto contactDto) {
        ContactEntity contactEntity = modelMapper.toEntity(contactDto);
        contactRepository.insert(contactEntity);
        return contactDto;
    }

    public List<ContactDto> saveNewContact(List<ContactDto> contactDto) {
        List<ContactEntity> contactEntityList = contactDto.stream()
                .map(el -> modelMapper.toEntity(el))
                .collect(Collectors.toList());
        contactRepository.insertAll(contactEntityList);
        return contactDto;
    }

    public ContactDto getContactById(Long id) {
        return modelMapper.toDto(contactRepository.findById(id));
    }

    public List<ContactDto> getContactByIds(List<Long> ids) {
        List<ContactEntity> contactEntity = contactRepository.findByIds(ids);
        return contactEntity.stream()
                .map(el -> modelMapper.toDto(el))
                .collect(Collectors.toList());
    }

    public Boolean deleteContactById (Long id){
        return contactRepository.deleteById(id);
    }
}
