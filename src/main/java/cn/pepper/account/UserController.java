package cn.pepper.account;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class UserController {
    @RequestMapping("/account")
    String collect() {
        log.info("I am run!");
        return "haha";
    }
}
