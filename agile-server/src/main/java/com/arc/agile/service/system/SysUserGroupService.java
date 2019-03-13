package com.arc.agile.service.system;

import com.arc.agile.model.domain.system.SysUserGroup;

import java.util.List;

/**
 * @author 叶超
 * @since 2019/3/12 11:52
 */
public interface SysUserGroupService {


      Long save(SysUserGroup userGroup);

      List<SysUserGroup> list() ;

}
