package com.zjc.controller;

import com.zjc.dao.HeroDao;
import com.zjc.entity.Hero;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Big HandsomeMan
 * @date 2021-08-25 15:31:24
 */
@Controller
@RequestMapping(value = "/system")
public class HeroController {
    @Resource
    private HeroDao heroDao;

    @GetMapping("/index")
    public String index(Model model) {
        List<Hero> heroes = heroDao.getAllHeroes();
        model.addAttribute("heroes", heroes);
        return "index";
    }

    @GetMapping("/edit")
    public String edit(Model model, int id) {
        Hero hero = heroDao.getHeroById(id);
        model.addAttribute("hero", hero);
        return "edit";
    }

    @PostMapping("/edit")
    @ResponseBody
    public boolean editHero(Hero hero) {
        return heroDao.updateHeroById(hero);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public boolean delete(int id) {
        return heroDao.deleteHeroById(id);
    }

    @GetMapping("/add")
    public String add() {
        return "add";
    }

    @RequestMapping("/addHero")
    @ResponseBody
    public boolean addHero(Hero hero) {
        return heroDao.addHero(hero);
    }
}
