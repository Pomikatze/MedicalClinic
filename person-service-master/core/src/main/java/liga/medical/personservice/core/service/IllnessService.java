package liga.medical.personservice.core.service;

import liga.medical.personservice.core.mapper.IllnessMapper;
import liga.medical.personservice.core.model.IllnessEntity;
import liga.medical.personservice.core.repository.IllnessRepository;
import liga.medical.personservice.dto.IllnessDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class IllnessService {

    IllnessRepository illnessRepository;
    IllnessMapper modelMapper;

    @Autowired
    public IllnessService(IllnessRepository illnessRepository, IllnessMapper illnessMapper) {
        this.illnessRepository = illnessRepository;
        this.modelMapper = illnessMapper;
    }

    public IllnessDto saveNewIllness(IllnessDto illnessDto) {
        IllnessEntity illnessEntity = modelMapper.toEntity(illnessDto);
        illnessRepository.insert(illnessEntity);
        return illnessDto;
    }

    public List<IllnessDto> saveNewIllness(List<IllnessDto> illnessDtos) {
        List<IllnessEntity> illnessEntityList = illnessDtos.stream()
                .map(el -> modelMapper.toEntity(el))
                .collect(Collectors.toList());
        illnessRepository.insertAll(illnessEntityList);
        return illnessDtos;
    }

    public IllnessDto getIllnessById(Long id) {
        return modelMapper.toDto(illnessRepository.findById(id));
    }

    public List<IllnessDto> getAll() {
        List<IllnessEntity> illnessEntityList = illnessRepository.findAll();
        return illnessEntityList.stream()
                .map(el -> modelMapper.toDto(el))
                .collect(Collectors.toList());
    }

    public Boolean deleteIllnessById (Long id){
        return illnessRepository.deleteById(id);
    }
}
