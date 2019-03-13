package com.arc.agile.service.system.impl;

import com.arc.agile.mapper.system.SysUserGroupMapper;
import com.arc.agile.model.domain.system.SysUserGroup;
import com.arc.agile.service.system.SysUserGroupService;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 叶超
 * @since 2019/3/12 11:52
 */
@Slf4j
@Service
public class SysUserGroupServiceImpl implements SysUserGroupService {

    @Autowired
    private SysUserGroupMapper userGroupMapper;


    @Override
    public Long save(SysUserGroup userGroup) {
        int insert = userGroupMapper.insert(userGroup);
        return userGroup.getId();
    }

    @Override
    public List<SysUserGroup> list() {
        Wrapper<SysUserGroup> query = null;

        List<SysUserGroup> sysUserGroups = userGroupMapper.selectList(query);
        System.out.println(sysUserGroups.size());
        System.out.println(sysUserGroups);
        System.out.println(sysUserGroups.size());
        return sysUserGroups;
    }

}
