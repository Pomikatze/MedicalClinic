package liga.medical.personservice.core.repository;

import liga.medical.personservice.core.model.AddressEntity;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AddressRepository {

    @Select("select * from address where id = #{addressId}")
    AddressEntity findById(Long addressId);

    @Insert("insert into address (contact_id, country_id, city, street, building) " +
            "values(#{contactId}, #{countryId}, #{city}, #{street}, #{building})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int insert(AddressEntity addressEntity);

    @Select("select * from address")
    List<AddressEntity> findAll ();

    @Delete("delete from address where id = #{id}")
    Boolean deleteById (Long id);

    @Update("update address set contact_id = #{contactId}, country_id = #{countryId}, city = #{city}, " +
    "index = #{index}, street = #{street}, building = #{building}, flat = #{flat} where id = #{id}")
    Boolean updateById (AddressEntity addressEntity);

    @Insert("insert into address (contact_id, country_id, city, street, building) " +
            "values(#{contactId}, #{countryId}, #{city}, #{street}, #{building})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int insertAll (List<AddressEntity> addressEntityList);
}
