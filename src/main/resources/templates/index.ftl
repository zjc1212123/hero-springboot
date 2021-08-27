<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>英雄管理主页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <script src="../layui/layui.js" charset="utf-8" type="text/javascript"></script>
    <script src="../jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>
<div class="layui-btn-container">
    <button type="button" class="layui-btn layui-btn-warm" onclick="location.href ='system/add' ">添加英雄</button>
</div>
<div class="layui-form">
    <table class="layui-table" lay-skin="line" style="margin: 0 0 10px 0">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>英雄ID</th>
            <th>英雄名称</th>
            <th>英雄头像</th>
            <th>英雄类型</th>
            <th>英雄技能</th>
            <th>技能介绍</th>
            <th>相关操作</th>
        </tr>
        </thead>
        <tbody>
        <#list heroes as hero>
            <tr>
                <td>${hero.id}</td>
                <td>${hero.name}</td>
                <td>
                    <img src="${hero.avatar}" alt="">
                </td>
                <td>
                    <#if hero.type == 1 > 坦克</#if>
                    <#if hero.type == 2 > 战士</#if>
                    <#if hero.type == 3 > 刺客</#if>
                    <#if hero.type == 4 > 法师</#if>
                    <#if hero.type == 5 > 射手</#if>
                    <#if hero.type == 6 > 辅助</#if>
                </td>
                <td>${hero.skill}</td>
                <td>${hero.skill_describe}</td>
                <td>
                    <button type="button" class="layui-btn layui-btn-normal "
                            onclick="location.href='system/edit?id=${hero.id}'">修改
                    </button>
                    <button type="button" class="layui-btn layui-btn-normal" onclick="deleteHero(${hero.id})">删除
                    </button>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
</body>
<script>
    function deleteHero(id) {
        $.ajax({
            url: 'system/delete',
            type: 'post',
            data: {id: id},
            success: function (res) {
                console.log(res);
                if (res === true) {
                    alert("删除成功")
                    location.reload();
                }
                if (res === false) {
                    alert("删除失败")
                }
            }
        })
    }
</script>
</html>