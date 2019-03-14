package com.arc.agile.controller.data.agile;

import com.arc.agile.model.domain.agile.Project;
import com.arc.agile.service.agile.ProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @author 叶超
 * @since 2019/3/12 9:20
 */
@Slf4j
@RestController
@RequestMapping("/project")
public class ProjectController {

    @Resource
    private ProjectService projectService;

    @PostMapping("/save")
    public Object save(@RequestBody Project project) {
        log.debug(" save 接口的参数={}", project);
        return projectService.save(project);
    }

    @PostMapping("/update")
    public Object update(@RequestBody Project project) {
        log.debug(" update 接口的参数={}", project);
        return projectService.update(project);
    }

    @GetMapping("/get/{id}")
    public Object get(@PathVariable(name = "id", required = true) Long id) {
        log.debug(" get 接口的参数id={}", id);
        return projectService.get(id);
    }

    @GetMapping("/delete/{id}")
    public Object delete(@PathVariable(name = "id", required = true) Long id) {
        log.debug(" delete 接口的参数id={}", id);
        return projectService.delete(id);
    }

    @RequestMapping("/list")
    public Object list() {
        return projectService.list();
    }


}
