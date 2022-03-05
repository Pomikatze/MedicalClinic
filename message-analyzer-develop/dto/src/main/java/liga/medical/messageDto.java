package liga.medical;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * dto содержит информацию о пациенте после распарсивания сообщения с устройства
 * @ownerId - id пациента
 * @condition - состояние пациента (пульс, температура тела и тд.)
 */

@Data
@NoArgsConstructor
public class messageDto {

private Long ownerId;

private String condition;
}
