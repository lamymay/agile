package com.arc.agile.service.agile;


import com.arc.model.domain.agile.ProjectChangeLog;

import java.util.List;

/**
 * @author 叶超
 * @since 2019/3/14 15:58
 */
public interface ProjectChangeLogService {


    Long save(ProjectChangeLog projectChangeLog);

    int delete(Long id);

    int update(ProjectChangeLog projectChangeLog);

    ProjectChangeLog get(Long id);

    List<ProjectChangeLog> list();

}
