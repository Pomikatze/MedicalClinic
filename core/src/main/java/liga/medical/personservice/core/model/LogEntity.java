package liga.medical.personservice.core.model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class LogEntity {

    private Long id;

    private LocalDateTime timestamp;

    private String method;

    private String className;

    private String Person;
}
