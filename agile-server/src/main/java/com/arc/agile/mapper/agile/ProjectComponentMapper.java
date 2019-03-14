package com.arc.agile.mapper.agile;

import com.arc.agile.mapper.SuperMapper;
import com.arc.agile.model.domain.agile.ProjectComponent;

import java.util.List;

/**
 * ProjectComponent
 *
 * @author 叶超
 * @since 2019/3/14 15:14
 */
public interface ProjectComponentMapper extends SuperMapper<ProjectComponent> {

    int save(ProjectComponent component);

    int delete(Long id);

    int update(ProjectComponent component);

    ProjectComponent get(Long id);

    List<ProjectComponent> list();

}
