package liga.medical.personservice.core.repository;

import liga.medical.personservice.core.model.LogEntity;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogRepository {

    @Insert("insert into log (timestamp, method, class, person) " +
            "values (#{log.timestamp}, #{log.method}, #{log.className}, #{log.person}")
    LogEntity saveLog (LogEntity log);
}
