package com.zjc.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ShearCaptcha;
import com.zjc.dao.HeroDao;
import com.zjc.entity.Hero;
import com.zjc.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(HttpSession session, HttpServletRequest request) {
        User user = new User();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        user.setUsername(username);
        user.setPassword(password);
        User realUser = heroDao.isUser(user);
        String captchaCode = session.getAttribute("captchaCode").toString();
        String captcha = request.getParameter("captcha");
        String code;
        if (realUser == null) {
            code = "0";
            System.out.println("用户不存在");
        } else {
            if (!realUser.getPassword().equals(user.getPassword())) {
                code = "1";
                System.out.println("密码错误");
            }
            if (!captchaCode.equals(captcha)) {
                code = "2";
                System.out.println("验证码错误");
            } else {
                code = "3";
                System.out.println("登录成功");
            }
        }

        return code;
    }


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

    @RequestMapping("/captcha")
    public void captcha(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        ShearCaptcha captcha = CaptchaUtil.createShearCaptcha(116, 40, 4, 3);
        //将验证吗写出到流
        try {
            captcha.write(response.getOutputStream());
            response.getOutputStream().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //获取验证码内容存入session
        String captchaCode = captcha.getCode();
        session.setAttribute("captchaCode", captchaCode);
    }
}
