package liga.medical.personservice.core.controller;

import liga.medical.personservice.core.service.IllnessService;
import liga.medical.personservice.dto.IllnessDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Validated
@RestController
@RequestMapping("/illness")
public class IllnessController {

    @Autowired
    private IllnessService illnessService;

    @PostMapping("/save")
    ResponseEntity<IllnessDto> saveIllness (@RequestBody IllnessDto illnessDto){
        return ResponseEntity.ok(illnessService.saveNewIllness(illnessDto));
    }

    @PostMapping("/saveAll")
    ResponseEntity<List<IllnessDto>> saveIllness (@RequestBody List<IllnessDto> illnessDtos){
        return ResponseEntity.ok(illnessService.saveNewIllness(illnessDtos));
    }

    @GetMapping("/{id}")
    IllnessDto getIllnessById (@PathVariable Long id){
        return illnessService.getIllnessById(id);
    }

    @GetMapping("/")
    List<IllnessDto> getAll (){
        return illnessService.getAll();
    }

    @DeleteMapping("/{id}")
    ResponseEntity<Boolean> deleteIllness (@PathVariable Long id){
        return ResponseEntity.ok(illnessService.deleteIllnessById(id));
    }
}
