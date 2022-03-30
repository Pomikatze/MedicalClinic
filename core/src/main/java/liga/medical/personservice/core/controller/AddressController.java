package liga.medical.personservice.core.controller;

import liga.medical.personservice.core.model.AddressEntity;
import liga.medical.personservice.core.repository.AddressRepository;
import liga.medical.personservice.core.service.AddressService;
import liga.medical.personservice.dto.AddressDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Validated
@RestController
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @GetMapping("/{id}")
    AddressDto getAddressById (@PathVariable Long id) {
        return addressService.getAddressById(id);
    }

    @GetMapping("/")
    List<AddressDto> getAll (){
        return addressService.getAll();
    }

    @PostMapping("/save")
    ResponseEntity<AddressDto> saveAddress (@RequestBody AddressDto addressDto){
        return ResponseEntity.ok(addressService.saveAddress(addressDto));
    }

    @PostMapping("/saveAll")
    ResponseEntity<List<AddressDto>> saveAllAddress (@RequestBody List<AddressDto> addressDtos){
        return ResponseEntity.ok(addressService.saveAllAddress(addressDtos));
    }

    @DeleteMapping("/{id}")
    ResponseEntity<Boolean> deleteById (@PathVariable Long id){
        return ResponseEntity.ok(addressService.deleteAddressById(id));
    }
}
