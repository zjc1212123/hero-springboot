<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理-登陆</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="../lib/layui-v2.6.3/layui.js" charset="utf-8" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            background-image: url("../images/bg.jpg");
            height: 100%;
            width: 100%;
        }

        #container {
            height: 100%;
            width: 100%;
        }

        input:-webkit-autofill {
            -webkit-box-shadow: inset 0 0 0 1000px #fff;
            background-color: transparent;
        }

        .admin-login-background {
            width: 300px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 40%;
            margin-left: -150px;
            margin-top: -100px;
        }

        .admin-header {
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
            font-weight: bold;
            font-size: 40px
        }

        .admin-input {
            border-top-style: none;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            height: 50px;
            width: 300px;
            padding-bottom: 0px;
        }

        .admin-input::-webkit-input-placeholder {
            color: #a78369
        }

        .layui-icon-username {
            color: #a78369 !important;
        }

        .layui-icon-username:hover {
            color: #9dadce !important;
        }

        .layui-icon-password {
            color: #a78369 !important;
        }

        .layui-icon-password:hover {
            color: #9dadce !important;
        }

        .admin-input-username {
            border-top-style: solid;
            border-radius: 10px 10px 0 0;
        }

        .admin-input-verify {
            border-radius: 0 0 10px 10px;
        }

        .admin-button {
            margin-top: 20px;
            font-weight: bold;
            font-size: 18px;
            width: 300px;
            height: 50px;
            border-radius: 5px;
            background-color: #a78369;
            border: 1px solid #d8b29f
        }

        .admin-icon {
            margin-left: 260px;
            margin-top: 10px;
            font-size: 30px;
        }

        i {
            position: absolute;
        }

        .admin-captcha {
            position: absolute;
            margin-left: 205px;
            margin-top: -40px;
        }
    </style>
</head>
<body>
<div id="container layui-anim layui-anim-upbit">
    <div></div>
    <div class="admin-login-background">
        <div class="admin-header">
            <span>HeroManage</span>
        </div>
        <form class="layui-form">
            <div>
                <i class="layui-icon layui-icon-username admin-icon"></i>
                <input type="text" name="username" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon"></i>
                <input type="password" name="password" placeholder="请输入密码" autocomplete="off"
                       class="layui-input admin-input">
            </div>
            <div>
                <input type="text" name="captcha" placeholder="请输入验证码" autocomplete="off"
                       class="layui-input admin-input admin-input-verify">
                <img class="admin-captcha" width="90" height="30" src="captcha" onclick="this.src+='?'">
            </div>
            <button class="layui-btn admin-button" lay-submit="" lay-filter="login">Sign In</button>
        </form>
    </div>
</div>

<script>
    layui.use(['form'], function () {
        var form = layui.form
        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            if (data.username === '') {
                layer.msg('用户名不能为空');
                return false;
            }
            if (data.password === '') {
                layer.msg('密码不能为空');
                return false;
            }
            if (data.captcha === '') {
                layer.msg('验证码不能为空');
                return false;
            } else {
                $.post('login', data, function (res) {
                    console.log(res)
                    if (res === "0") {
                        layer.msg("用户不存在");
                    } else if (res === "1") {
                        layer.msg("密码错误");
                    } else if (res === "2") {
                        layer.msg("验证码错误");
                    } else if (res === "3") {
                        layer.msg("登录成功");
                        location.href = "index"
                    }
                })
            }
            return false;
        });
    });
</script>
</body>
</html>