package com.arc.agile.controller.data.agile;

import com.arc.agile.service.agile.ProjectService;
import com.arc.model.domain.agile.Project;
import com.arc.model.request.agile.ProjectRequest;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 项目模块的controller
 * 其中整个系统中的出口尽量才用统一风格--RESTFul，但是不必拘泥于该风格， 带有业务流程的接口允许单独定义
 * 明显单表的CRUD并且无关联操作的情使用GET/PUT/DELETE 等方法
 * 权限控制请示用系统的自定义注解去完成，权限在系统中只是定义，权限的基本关系维护请移步前段页面操作，即：
 * 例子：对于系统人员模块，有用户的增删改查，分页查询，等等，那么资源扫描入库的时候尽量只是源数据的记录，二八哪些数据归为一类，哪些数据与哪些数据是一类（具有明显层级的结构）
 * 系统的人员团队管理明显包含（user-role-resource-userGroup-menu等模块，这些模块本身自成体系，联合起来就是系统人员模块）
 *
 * @author 叶超
 * @since 2019/3/12 9:20
 */
@Api
@Slf4j
@RestController
@RequestMapping("/projects")
public class ProjectController {

    //该类提供的接口，新增，修改，删除，分页（条件）查询，单条条件查询
    // 注意：新增接口需要处理单表以外的数据，即：新增一个像的同时，1、项目的类型亦需要记录 2、项目关联的用户组 3、项目使用规则绑定或者创建新规则
    @Resource
    private ProjectService projectService;

    @PostMapping("")
    public Object save(@RequestBody Project project) {
        log.debug(" save 接口的参数={}", project);
        return projectService.save(project);
    }

    @PutMapping("")
    public Object update(@RequestBody Project project) {
        log.debug(" update 接口的参数={}", project);
        return projectService.update(project);
    }

    @GetMapping("/{id}")
    public Object get(@PathVariable(name = "id", required = true) Long id) {
        log.debug(" get 接口的参数id={}", id);
        return projectService.get(id);
    }

    @DeleteMapping("/{id}")
    public Object delete(@PathVariable(name = "id", required = true) Long id) {
        log.debug(" delete 接口的参数id={}", id);
        return projectService.delete(id);
    }

    @PostMapping("/page")
    public Object list(@RequestBody ProjectRequest request) {
        return projectService.page(request);
    }


}
