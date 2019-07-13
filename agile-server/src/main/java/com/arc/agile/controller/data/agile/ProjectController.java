package com.arc.agile.controller.data.agile;

import com.arc.agile.model.domain.agile.Project;
import com.arc.agile.service.agile.ProjectService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author 叶超
 * @since 2019/3/12 9:20
 */
@Api
@Slf4j
@RestController
@RequestMapping("/projects")
public class ProjectController {

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
    public Object list(@RequestBody ProjectRequest Request) {
        return projectService.list();
    }


}
