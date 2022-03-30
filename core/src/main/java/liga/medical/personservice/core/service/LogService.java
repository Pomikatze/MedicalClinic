package liga.medical.personservice.core.service;

import liga.medical.personservice.core.model.LogEntity;
import liga.medical.personservice.core.repository.LogRepository;
import org.springframework.stereotype.Service;

@Service
public class LogService {

    LogRepository logRepository;

    public LogService(LogRepository logRepository) {
        this.logRepository = logRepository;
    }

    public LogEntity saveLog (LogEntity log) {
        return logRepository.saveLog(log);
    }
}
