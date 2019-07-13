package com.arc.agile.service.agile.impl;

import com.arc.agile.mapper.agile.ProjectMapper;
import com.arc.agile.service.agile.ProjectService;
import com.arc.model.domain.agile.Project;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 叶超
 * @since 2019/3/14 16:22
 */
@Slf4j
@Service
public class ProjectServiceImpl implements ProjectService {

    @Resource
    private ProjectMapper projectMapper;


    @Override
    public Long save(Project project) {
        return projectMapper.save(project) == 0 ? null : project.getId();
    }

    @Override
    public Integer delete(Long id) {
        return projectMapper.delete(id);
    }

    @Override
    public Integer update(Project project) {
        return projectMapper.update(project);
    }

    @Override
    public Project get(Long id) {
        return projectMapper.get(id);
    }

    @Override
    public List<Project> list() {
        return projectMapper.list();
    }
}
