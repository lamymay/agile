package com.arc.agile.mapper.agile;

import com.arc.agile.mapper.SuperMapper;
import com.arc.agile.model.domain.agile.Project;

import java.util.List;

/**
 * 项目
 * @author 叶超
 * @since 2019/3/14 15:14
 */
public interface ProjectMapper extends SuperMapper<Project> {

    int save(Project project);

    int delete(Long id);

    int update(Project project);

    Project get(Long id);

    List<Project> list();

}
