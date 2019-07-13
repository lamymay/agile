package com.arc.agile.service.agile;


import com.arc.model.domain.agile.Project;

import java.util.List;

/**
 * @author 叶超
 * @since 2019/3/14 15:58
 */
public interface ProjectService {

    Long save(Project project);

    Integer delete(Long id);

    Integer update(Project project);

    Project get(Long id);

    List<Project> list();
}
