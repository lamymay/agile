package com.arc.agile.model.domain.agile;

import com.arc.agile.model.domain.BaseModel;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * 工作内容表（可能是一个project也可能是多个project组成的）
 *
 * @author 叶超
 * @since 2018/12/26 11:28
 */
@Getter
@Setter
public class ProjectComponent extends BaseModel {

    private static final long serialVersionUID = 1L;

    private Long id;// 项目数据修改日志表ID
    private String code;// 字符编码,冗余
    private Long projectId;// 项目表ID
    private String name;// 名称-128
    private Integer state;// 状态
    private Integer areaLevel;// 级别
    private Integer parentId;// 父节点ID（子项目做级联用）
    private String parentName;// 父节点名
    private String note;// 注释
    private String url;// 地址
    private Date createDate;// 创建时间
    private Date updateDate;// 更新时间
}
