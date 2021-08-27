package com.zjc.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Big HandsomeMan
 * @date 2021-08-26 20:41:50
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hero {
    private int id;
    private String name;
    private String avatar;
    private int type;
    private String skill;
    private String skill_describe;
}
