package com.arc.agile.controller.data.system;

import com.arc.agile.model.domain.system.SysUser;
import com.arc.agile.service.system.SysUserGroupService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;

/**
 * @author 叶超
 * @since 2019/3/12 12:58
 */
@Slf4j
@RestController
@RequestMapping("/user/group")
public class SysUserGroupController {

    @Autowired
    private SysUserGroupService userGroupService;

    @GetMapping("/list")
    public Object list() {
        return userGroupService.list();
    }

    @PostMapping("/v1")
    public Object test(HttpServletRequest request,

                       @RequestBody SysUser user) {
        try (ServletInputStream inputStream = request.getInputStream()) {

            String k1 = request.getHeader("k1");
            System.out.println(k1);

            BufferedReader reader = request.getReader();

            System.out.println(reader.toString());
            System.out.println(reader);

        } catch (Exception e) {
            e.printStackTrace();

        }
        return userGroupService.list();
    }
}
