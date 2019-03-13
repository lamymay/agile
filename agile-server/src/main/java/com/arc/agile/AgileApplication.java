package com.arc.agile;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/**
 * 住启动类，最终文件会打包为jar，直接执行该jar包
 */
//@MapperScan("com.arc.agile.mapper")
@SpringBootApplication
public class AgileApplication {

    public static void main(String[] args) {
        SpringApplication.run(AgileApplication.class, args);
    }

}
