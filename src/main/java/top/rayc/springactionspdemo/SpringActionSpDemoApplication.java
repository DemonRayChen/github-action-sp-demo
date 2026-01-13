package top.rayc.springactionspdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@SpringBootApplication
@Controller
@RequestMapping
public class SpringActionSpDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringActionSpDemoApplication.class, args);
    }

    @GetMapping("/")
    @ResponseBody
    public static String home() {
        return "Hello World!";
    }

}
