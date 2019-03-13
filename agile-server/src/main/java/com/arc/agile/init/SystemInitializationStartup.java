package com.arc.agile.init;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * @description: 初始化操作
 * @author: yechao
 * @date: 2019/1/2 23:24
 */
@Slf4j
@Component
public class SystemInitializationStartup implements ApplicationListener<ContextRefreshedEvent> {


    //建议配置在配置文件中
    @Value("${my.system.initial:true}")
    boolean initial;


    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        //Spring容器加载完毕之后执行: 以下方法
        if (initial) {
            System.out.println("#########################");
            System.out.println("Spring容器加载完毕之后执行，todo 一些初始化业务逻辑");
            System.out.println("#########################");
        }
    }


}
