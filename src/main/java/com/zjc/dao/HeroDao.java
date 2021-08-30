package com.zjc.dao;

import com.zjc.entity.Hero;
import com.zjc.entity.User;
import org.apache.ibatis.annotations.*;


import java.util.List;

/**
 * @author Big HandsomeMan
 * @date 2021-08-26 20:45:53
 */
@Mapper
public interface HeroDao {
    /*
     * 查询所有的英雄
     */
    @Select("select * from hero")
    List<Hero> getAllHeroes();

    /*
     * 根据id查询英雄所有信息
     */
    @Select("select * from hero where id = #{id}")
    Hero getHeroById(Integer id);

    /*
     * 根据id删除英雄
     */
    @Delete("delete from hero where id = #{id}")
    boolean deleteHeroById(Integer id);

    /*
     * 根据id更新英雄信息
     */
    @Update("UPDATE `hero` SET name = #{name} , avatar = #{avatar},type = #{type},skill = #{skill},skill_describe = #{skill_describe} WHERE id = #{id}")
    boolean updateHeroById(Hero hero);

    /*
     * 添加英雄
     */
    @Insert("insert into hero (name,avatar,type,skill,skill_describe) values(#{name},#{avatar},#{type},#{skill},#{skill_describe})")
    boolean addHero(Hero hero);

    /*
     * 查询用户登录,根据用户名查询
     */
    @Select("select * from user where username = #{username}")
    User isUser(User user);
}
