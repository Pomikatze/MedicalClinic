package liga.medical.personservice.core.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Set;

@Data
@NoArgsConstructor
public class PersonDataEntity implements UserDetails {

    private Long id;

    private String lastName;

    private String firstName;

    private LocalDate birthDate;

    private short age;

    private char sex;

    private Long contactId;

    private Long medicalCardId;

    private Long parentId;

    private String email;

    private String password;

    private Set<Role> role;

    public PersonDataEntity(String lastName, String firstName, LocalDate birthDate, char sex, Long contactId, Long medicalCardId, String email, String password, Set<Role> role) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.birthDate = birthDate;
        this.sex = sex;
        this.contactId = contactId;
        this.medicalCardId = medicalCardId;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRole();
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
