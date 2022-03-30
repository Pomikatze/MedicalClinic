package liga.medical.personservice.core.repository;

import liga.medical.personservice.core.model.Role;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface RoleRepository {

    @Select("select * from role where id = #{roleId}")
    Role findById (Long roleId);

    @Insert("insert into role (name) values (#{roleName})")
    void saveRole (String roleName);

    @Select("select * from role where name = #{roleName}")
    Role findEntityByName (String roleName);
}
