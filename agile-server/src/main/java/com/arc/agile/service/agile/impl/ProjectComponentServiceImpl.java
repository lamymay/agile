package com.arc.agile.service.agile.impl;

import com.arc.agile.service.agile.ProjectComponentService;
import com.arc.model.domain.agile.ProjectComponent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 叶超
 * @since 2019/3/14 16:20
 */
@Slf4j
@Service
public class ProjectComponentServiceImpl  implements ProjectComponentService {
    @Override
    public Long save(ProjectComponent component) {
        return null;
    }

    @Override
    public Integer delete(Long id) {
        return null;
    }

    @Override
    public Integer update(ProjectComponent component) {
        return null;
    }

    @Override
    public ProjectComponent get(Long id) {
        return null;
    }

    @Override
    public List<ProjectComponent> list() {
        return null;
    }
}
