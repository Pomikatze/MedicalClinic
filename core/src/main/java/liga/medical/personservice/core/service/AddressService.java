package liga.medical.personservice.core.service;

import liga.medical.personservice.core.mapper.AddressMapper;
import liga.medical.personservice.core.model.AddressEntity;
import liga.medical.personservice.core.repository.AddressRepository;
import liga.medical.personservice.dto.AddressDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AddressService {

    AddressRepository addressRepository;
    AddressMapper modelMapper;

    @Autowired
    public AddressService(AddressRepository addressRepository, AddressMapper modelMapper) {
        this.addressRepository = addressRepository;
        this.modelMapper = modelMapper;
    }

    public AddressDto getAddressById (Long id) {
        AddressEntity addressEntity = addressRepository.findById(id);
        return modelMapper.toDto(addressEntity);
    }

    public List<AddressDto> getAll (){
        return addressRepository.findAll().stream()
                .map(al -> modelMapper.toDto(al)).collect(Collectors.toList());
    }

    public AddressDto saveAddress (AddressDto addressDto){
        addressRepository.insert(modelMapper.toEntity(addressDto));
        return addressDto;
    }

    public List<AddressDto> saveAllAddress (List<AddressDto> addressDtos){
        List<AddressEntity> addressEntityList = addressDtos.stream().map(al -> modelMapper.toEntity(al))
                .collect(Collectors.toList());
        addressRepository.insertAll(addressEntityList);
        return addressDtos;
    }

    public Boolean deleteAddressById (Long id){
        return addressRepository.deleteById(id);
    }
}
