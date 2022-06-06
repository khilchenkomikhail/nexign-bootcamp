package nexign.bootcamp.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class Controller {

    @GetMapping("/")
    public String showHTML() {
        return "file";
    }
}
