package medicalClinic.core.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@Entity
@Table (name = "patient")
public class PatientEntity {
    @Id
    @Column (name = "id")
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "gender", nullable = false)
    private String gender;

    @Column(name = "age")
    private Integer age;

    @Column(name = "city", nullable = false)
    private String city;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "birthday_dt", nullable = false)
    private LocalDate birthdayDt;

    @Column(name = "birth_place", nullable = false)
    private String birthPlace;

    @Column(name = "registration", nullable = false)
    private String registration;

    @Column(name = "passport_series", nullable = false)
    private String passportSeries;

    @Column(name = "passport_number", nullable = false)
    private String passportNumber;

    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;

    @Column(name = "another_document")
    private String anotherDocument;

    public PatientEntity(Long id, String name, String gender, Integer age, String city, String address, LocalDate birthdayDt, String birthPlace, String registration, String passportSeries, String passportNumber, String phoneNumber, String anotherDocument) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.city = city;
        this.address = address;
        this.birthdayDt = birthdayDt;
        this.birthPlace = birthPlace;
        this.registration = registration;
        this.passportSeries = passportSeries;
        this.passportNumber = passportNumber;
        this.phoneNumber = phoneNumber;
        this.anotherDocument = anotherDocument;
    }
}
