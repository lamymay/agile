package com.arc.agile.service.agile.impl;

import com.arc.agile.model.domain.agile.ProjectChangeLog;
import com.arc.agile.service.agile.ProjectChangeLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 叶超
 * @since 2019/3/14 15:58
 */
@Slf4j
@Service
public class ProjectChangeLogServiceImpl implements ProjectChangeLogService {
    @Override
    public Long save(ProjectChangeLog projectChangeLog) {
        return null;
    }

    @Override
    public int delete(Long id) {
        return 0;
    }

    @Override
    public int update(ProjectChangeLog projectChangeLog) {
        return 0;
    }

    @Override
    public ProjectChangeLog get(Long id) {
        return null;
    }

    @Override
    public List<ProjectChangeLog> list() {
        return null;
    }
}
