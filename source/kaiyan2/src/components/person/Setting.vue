<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="con-setting">
            <section class="setting-item">
                <h5>常规设置</h5>
                <ul class="list-group">
                    <li class="list-group-item clearfix">
                        <div class="pull-left">更换头像</div>
                        <div class="pull-right">
                            <img src="../../assets/back.jpg" alt="head" />
                        </div>
                    </li>
                    <li class="list-group-item clearfix">
                        <div class="pull-left">更改昵称</div>
                        <div class="pull-right">游学者、墨槿</div>
                    </li>
                    <li class="list-group-item clearfix">
                        <div class="pull-left">编辑个人简介</div>
                        <div class="pull-right">人生不是戏剧，而我亦非主角</div>
                    </li>
                </ul>
            </section>
            <section class="setting-item">
                <h5>通用设置</h5>
                <ul class="list-group">
                    <li class="list-group-item clearfix">
                        <div class="pull-left">默认编辑器</div>
                        <div class="pull-right">富文本</div>
                    </li>
                    <li class="list-group-item clearfix">显示模式设置</li>
                    <li @click="goTo('blacklist')" class="list-group-item clearfix">黑名单管理</li>
                </ul>
            </section>
            <section class="setting-item">
                <h5>安全设置</h5>
                <ul class="list-group">
                    <li class="list-group-item clearfix">修改登录密码</li>
                </ul>
            </section>
            <section class="setting-item">
                <h5>其他内容</h5>
                <ul class="list-group">
                    <li @click="goTo('recycleBin')" class="list-group-item clearfix">回收站管理</li>
                    <li class="list-group-item clearfix">
                        <div class="pull-left">版本更新</div>
                        <div class="pull-right">富文本</div>
                    </li>
                    <li class="list-group-item clearfix">关于我们</li>
                </ul>
            </section>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../../components/common/Header"

    export default {
        name: "PersonSetting",
        components: {
            HeaderTemp
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "编辑个人资料",
                        isSearch: false,
                        isSetting: false
                    }
                }
            }
        },
        methods: {
            routerBack() {
                this.$router.back();
            },
            goTo(page, param) {
                this.$router.push({
                    name: page,
                    param: param
                })
            }
        }
    }
</script>

<style scoped lang="scss">
    @import "../../common/scss/common";

    .con-setting {

        .setting-item {

            h5 {
                padding-left: 15px;
                color: $colorMain;
            }
            .list-group-item {
                height: 52px;
                line-height: 30px;

                .pull-left {
                    width: 30%;
                    min-width: 90px;
                }
                .pull-right {
                    width: 65%;
                    min-width: 215px;
                    text-align: right;
                    color: $colorFontIntro;
                    @include ellipsis;

                    img {
                        width: 30px;
                        height: 30px;
                        border-radius: 15px;
                    }
                }
            }
        }
    }
</style>
