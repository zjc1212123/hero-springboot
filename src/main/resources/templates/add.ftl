<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>英雄添加页面</title>
    <base href="${request.contextPath}/">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="layui/layui.js" charset="utf-8" type="text/javascript"></script>
    <script src="jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>
<blockquote class="layui-elem-quote layui-text">
    英雄编辑页面
</blockquote>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">英雄名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" lay-reqtext="英雄名称是必填项，岂能为空？" placeholder="请输入英雄名称"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">英雄头像</label>
        <div class="layui-input-block">
            <input type="text" name="avatar" lay-verify="required" lay-reqtext="英雄头像必填项，岂能为空？" placeholder="请输入英雄头像地址"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">英雄类型</label>
        <div class="layui-input-block">
            <select name="type" lay-filter="type">
                <option value=""></option>
                <option value="1">坦克</option>
                <option value="2">战士</option>
                <option value="3">刺客</option>
                <option value="4">法师</option>
                <option value="5">射手</option>
                <option value="6">辅助</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">英雄技能</label>
        <div class="layui-input-block">
            <input type="text" name="skill" lay-verify="required" lay-reqtext="英雄技能必填项，岂能为空？" placeholder="请输入英雄技能名称"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">技能介绍</label>
        <div class="layui-input-block">
            <input type="text" name="skill_describe" lay-verify="required" lay-reqtext="技能介绍必填项，岂能为空？"
                   placeholder="请输入英雄技能介绍" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="sub">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置信息</button>
        </div>
    </div>
</form>
</body>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
        //监听提交
        form.on('submit(sub)', function (data) {
            var mess = data.field;
            $.ajax({
                url: 'system/addHero',
                data: mess,
                success: function (res) {
                    if (res === true) {
                        alert("添加成功")
                        location.reload();
                    } else {
                        alert("添加失败")
                    }
                }
            })
            return false;
        });
    });
</script>
</html>