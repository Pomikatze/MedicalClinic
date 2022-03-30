package liga.medical.personservice.core.controller;

import liga.medical.personservice.core.service.PersonDataService;
import liga.medical.personservice.dto.PersonDataDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RestController
@RequestMapping("/person/data")
public class PersonDataController {

    @Autowired
    PersonDataService personDataService;

    @GetMapping("/{id}")
    PersonDataDto findById (@PathVariable Long id){
        return personDataService.findById(id);
    }

    @GetMapping("/")
    List<PersonDataDto> findAll (){
        return personDataService.findAll();
    }

    @PostMapping("/save")
    ResponseEntity<PersonDataDto> savePersonData (@RequestBody PersonDataDto personDataDto){
        return ResponseEntity.ok(personDataService.savePersonData(personDataDto));
    }

    @DeleteMapping("/{id}")
    ResponseEntity<Boolean> deleteById (@PathVariable Long id){
        return ResponseEntity.ok(personDataService.deleteById(id));
    }
}
