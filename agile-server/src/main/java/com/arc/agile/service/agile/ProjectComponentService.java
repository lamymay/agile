package com.arc.agile.service.agile;

import com.arc.agile.model.domain.agile.ProjectComponent;

import java.util.List;

/**
 * @author 叶超
 * @since 2019/3/14 15:58
 */
public interface ProjectComponentService {

    Long save(ProjectComponent component);

    Integer delete(Long id);

    Integer update(ProjectComponent component);

    ProjectComponent get(Long id);

    List<ProjectComponent> list();

}
