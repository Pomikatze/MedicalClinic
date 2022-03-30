package liga.medical.personservice.core;

import liga.medical.personservice.core.model.Role;
import liga.medical.personservice.core.service.PersonDataService;
import liga.medical.personservice.core.service.RoleService;
import liga.medical.personservice.dto.PersonDataDto;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.time.LocalDate;

@Component
public class Init {

    private final RoleService roleService;
    private final PersonDataService personDataService;

    public Init(RoleService roleService, PersonDataService personDataService) {
        this.roleService = roleService;
        this.personDataService = personDataService;
    }

//    @PostConstruct
//    public void init() {
//
//        Role admin = new Role("ROLE_ADMIN");
//        Role user = new Role("ROLE_USER");
//
//        roleService.saveRole(admin.getName());
//        roleService.saveRole(user.getName());
//
//        PersonDataDto user1 = new PersonDataDto("Roma", "Gubin", LocalDate.of(2005, 1, 1), 'm', 1L, 1L, "r@mail.ru", "1");
//        PersonDataDto user2 = new PersonDataDto("Anna", "Borovkova", LocalDate.of(2005, 1, 1),'w', 2L, 2L,"anna.borovkova@gmail.com", "1q2w3e");
//
//        personDataService.setRoleByEmail(user1.getEmail(), roleService.findRoleEntityByName("ROLE_ADMIN").getId());
//        personDataService.setRoleByEmail(user2.getEmail(), roleService.findRoleEntityByName("ROLE_USER").getId());
//
//        personDataService.savePersonData(user1);
//        personDataService.savePersonData(user2);
//    }
}
