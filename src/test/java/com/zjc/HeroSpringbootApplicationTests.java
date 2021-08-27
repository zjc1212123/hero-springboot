package com.zjc;

import com.zjc.dao.HeroDao;
import com.zjc.entity.Hero;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.List;

@SpringBootTest
class HeroSpringbootApplicationTests {
    @Resource
    private HeroDao heroDao;

    @Test
    void contextLoads() {

    }

}
