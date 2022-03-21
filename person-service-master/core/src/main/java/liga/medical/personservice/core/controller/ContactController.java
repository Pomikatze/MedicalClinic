package liga.medical.personservice.core.controller;

import liga.medical.personservice.core.model.ContactEntity;
import liga.medical.personservice.core.repository.ContactRepository;
import liga.medical.personservice.core.service.ContactService;
import liga.medical.personservice.dto.ContactDto;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@Validated
@RestController
@RequestMapping("/contact")
public class ContactController {

    @Autowired
    private ContactService contactService;

    @PostMapping("/save")
    ResponseEntity<ContactDto> saveNewContact(@RequestBody @Valid ContactDto contactDto) {
        return ResponseEntity.ok(contactService.saveNewContact(contactDto));
    }

    @PostMapping("/save-all")
    ResponseEntity<List<ContactDto>> saveNewContact(@RequestBody @Valid List<ContactDto> contactDto) {
        return ResponseEntity.ok(contactService.saveNewContact(contactDto));
    }

    @GetMapping("/{id}")
    ContactDto getContactById(@PathVariable Long id) {
        return contactService.getContactById(id);
    }

    @GetMapping("/")
    List<ContactDto> getContactByIds(@RequestParam List<Long> ids) {
        return contactService.getContactByIds(ids);
    }

    @DeleteMapping("/{id}")
    ResponseEntity<Boolean> deleteContact (@PathVariable Long id){
        return ResponseEntity.ok(contactService.deleteContactById(id));
    }
}
