package com.douban.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 康俊彬
 */
@RestController
@RequestMapping("user")
public class UserController {

    @RequestMapping("login")
    public String login(@RequestBody User user){
        return "user";
    }
}
