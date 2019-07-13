package com.arc.agile.config.mybatis;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.arc.agile.mapper")
//@MapperScan("com.baomidou.springboot.mapper*")//这个注解，作用相当于下面的@Bean MapperScannerConfigurer，2者配置1份即可
public class MybatisPlusConfig {

    final String MAPPER_PACK_PATH = "com.arc.agile.mapper*";

    /**
     * mybatis-plus分页插件<br>
     * 文档：http://mp.baomidou.com<br>
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor page = new PaginationInterceptor();
        page.setDialectType("mysql");
        return page;
    }





//
//    /**
//     * 相当于顶部的：
//     * {@code @MapperScan("com.baomidou.springboot.mapper*")}
//     * 这里可以扩展，比如使用配置文件来配置扫描Mapper的路径
//     */
//    @Bean
//    public MapperScannerConfigurer mapperScannerConfigurer() {
//        MapperScannerConfigurer scannerConfigurer = new MapperScannerConfigurer();
//        scannerConfigurer.setBasePackage(MAPPER_PACK_PATH);
//        return scannerConfigurer;
//    }



//    /**
//     * 性能分析拦截器，不建议生产使用
//     */
//    @Bean
//    public PerformanceInterceptor performanceInterceptor() {
//        return new PerformanceInterceptor();
//    }

    //    @Bean
    //    public PaginationInterceptor paginationInterceptor() {
    //        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
    //        /*
    //         * 【测试多租户】 SQL 解析处理拦截器<br>
    //         * 这里固定写成住户 1 实际情况你可以从cookie读取，因此数据看不到 【 麻花藤 】 这条记录（ 注意观察 SQL ）<br>
    //         */
    //        List<ISqlParser> sqlParserList = new ArrayList<>();
    //        TenantSqlParser tenantSqlParser = new TenantSqlParser();
    //        tenantSqlParser.setTenantHandler(new TenantHandler() {
    //            @Override
    //            public Expression getTenantId() {
    //                return new LongValue(1L);
    //            }
    //
    //            @Override
    //            public String getTenantIdColumn() {
    //                return "tenant_id";
    //            }
    //
    //            @Override
    //            public boolean doTableFilter(String tableName) {
    //                // 这里可以判断是否过滤表
    //                /*if ("user".equals(tableName)) {
    //                    return true;
    //                }*/
    //                return false;
    //            }
    //        });
    //
    //
    //        sqlParserList.add(tenantSqlParser);
    //        paginationInterceptor.setSqlParserList(sqlParserList);
    ////        paginationInterceptor.setSqlParserFilter(new ISqlParserFilter() {
    ////            @Override
    ////            public boolean doFilter(MetaObject metaObject) {
    ////                MappedStatement ms = PluginUtils.getMappedStatement(metaObject);
    ////                // 过滤自定义查询此时无租户信息约束【 麻花藤 】出现
    ////                if ("com.baomidou.springboot.mapper.UserMapper.selectListBySQL".equals(ms.getId())) {
    ////                    return true;
    ////                }
    ////                return false;
    ////            }
    ////        });
    //        return paginationInterceptor;
    //    }
}