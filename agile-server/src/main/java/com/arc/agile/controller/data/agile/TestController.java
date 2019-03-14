package com.arc.agile.controller.data.agile;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @author 叶超
 * @since 2019/3/12 9:20
 */
@Slf4j
@RestController
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/v1")
    public Object list() {
        return new Date();

    }
}
