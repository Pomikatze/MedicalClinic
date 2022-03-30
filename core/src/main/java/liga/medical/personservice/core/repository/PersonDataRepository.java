package liga.medical.personservice.core.repository;

import liga.medical.personservice.core.model.PersonDataEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface PersonDataRepository {

    PersonDataEntity findById (@Param("dataId") Long dataId);

    List<PersonDataEntity> findAll();

    int insert(@Param("data") PersonDataEntity dataEntity);

    Boolean deleteById(@Param("dataId") Long dataId);

    PersonDataEntity findPersonByEmail (@Param("email") String email);

    @Update("update person_data set role = #{personRole} where email = #{personEmail}")
    void setRoleByEmail(@Param("personRole") Long personRole, @Param("personEmail") String personEmail);
}
