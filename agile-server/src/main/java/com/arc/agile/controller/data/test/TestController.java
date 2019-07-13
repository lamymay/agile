package com.arc.agile.controller.data.test;

import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @author 叶超
 * @since 2019/3/12 9:20
 */
@Api(value = "测试")
@Slf4j
@RestController
@RequestMapping("/tests")
public class TestController {

    @RequestMapping("/1")
    public Object list() {
        return new Date();

    }
}
