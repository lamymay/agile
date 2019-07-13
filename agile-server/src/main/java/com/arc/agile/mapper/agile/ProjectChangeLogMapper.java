package com.arc.agile.mapper.agile;

import com.arc.agile.mapper.SuperMapper;
import com.arc.model.domain.agile.ProjectChangeLog;

import java.util.List;

/**
 * ProjectChangeLog
 *
 * @author 叶超
 * @since 2019/3/14 15:14
 */
public interface ProjectChangeLogMapper extends SuperMapper<ProjectChangeLog> {

    int save(ProjectChangeLog projectChangeLog);

    int delete(Long id);

    int update(ProjectChangeLog projectChangeLog);

    ProjectChangeLog get(Long id);

    List<ProjectChangeLog> list();
}
