package com.huangrui.hr_smms.params;

import lombok.Data;

@Data
public class PageParam {

    private Integer currentPage;

    private Integer pageSize;

    private String queryString;

    private Long valueMonth;
}