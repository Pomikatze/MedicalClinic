package liga.medical.personservice.core.repository;

import liga.medical.personservice.core.model.PersonDataEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PersonDataRepository {

    PersonDataEntity findById (@Param("dataId") Long dataId);

    List<PersonDataEntity> findAll();

    int insert(@Param("data") PersonDataEntity dataEntity);

    Boolean deleteById(@Param("dataId") Long dataId);
}
