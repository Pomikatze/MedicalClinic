package liga.medical.personservice.core.repository;

import liga.medical.personservice.core.model.AddressEntity;
import liga.medical.personservice.core.model.IllnessEntity;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface IllnessRepository {

    @Select("select * from illness where id = #{illnessId}")
    IllnessEntity findById(Long illnessId);

    @Insert("insert into illness (medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) " +
            "values(#{medicalCardId}, #{typeId}, #{heaviness}, #{appearanceDttm}, #{recoveryDate})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int insert(IllnessEntity illnessEntity);

    @Select("select * from illness")
    List<IllnessEntity> findAll ();

    @Delete("delete from illness where id = #{id}")
    Boolean deleteById (Long id);

    @Update("update illness set medical_card_id = #{medicalCardId}, type_id = #{typeId}, heaviness = #{heaviness}, " +
            "appearance_dttm = #{appearanceDttm}, recovery_dt = #{recoveryDate} where id = #{id}")
    Boolean updateById (IllnessEntity illnessEntity);

    @Insert("insert into illness (medical_card_id, type_id, heaviness, appearance_dttm, recovery_dt) " +
            "values(#{medicalCardId}, #{typeId}, #{heaviness}, #{appearanceDttm}, #{recoveryDate})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int insertAll (List<IllnessEntity> illnessEntityList);
}
