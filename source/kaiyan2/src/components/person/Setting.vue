<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="con">
            <div class="con-setting">
                <section class="setting-item">
                    <h5>常规设置</h5>
                    <ul class="list-group">
                        <li @click="goTo('personMyHead')" class="list-group-item clearfix">
                            <div class="pull-left">更换头像</div>
                            <div @click.stop="preview()" class="pull-right">
                                <img :src="config.picUrl + user.head" alt="head" />
                            </div>
                        </li>
                        <li @click="open('.popup-nickname')" class="list-group-item clearfix">
                            <div class="pull-left">更改昵称</div>
                            <div class="pull-right" v-text="user.nickname"></div>
                        </li>
                        <li  @click="open('.popup-brief')" class="list-group-item clearfix">
                            <div class="pull-left">编辑个人简介</div>
                            <div class="pull-right" v-text="user.brief"></div>
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
                        <li @click="open('.popup-model')" class="list-group-item clearfix">显示模式设置</li>
                        <li @click="goTo('blacklist')" class="list-group-item clearfix">黑名单管理</li>
                    </ul>
                </section>
                <section class="setting-item">
                    <h5>安全设置</h5>
                    <ul class="list-group">
                        <li @click="open('.popup-password')" class="list-group-item clearfix">修改登录密码</li>
                    </ul>
                </section>
                <section class="setting-item">
                    <h5>其他内容</h5>
                    <ul class="list-group">
                        <li @click="goTo('recycleBin')" class="list-group-item clearfix">回收站管理</li>
                        <li class="list-group-item clearfix">
                            <div class="pull-left">版本更新</div>
                            <div class="pull-right">V1.5</div>
                        </li>
                        <li class="list-group-item clearfix">关于我们</li>
                    </ul>
                </section>
            </div>
            <div class="con-popup">
                <section class="popup popup-nickname">
                    <h4 class="popup-header">修改昵称</h4>
                    <form class="popup-form">
                        <div class="popup-form-item">
                            <label class="sr-only" for="nicknameInput">用户昵称</label>
                            <input id="nicknameInput" type="text" v-model="modify.nickname"/>
                        </div>
                    </form>
                    <div class="popup-footer">
                        <div class="btn-action pull-right">确定</div>
                        <div class="btn-action pull-right">取消</div>
                    </div>
                </section>
                <section class="popup popup-brief">
                    <h4 class="popup-header">编辑个人简介</h4>
                    <form class="popup-form">
                        <div class="popup-form-item">
                            <label class="sr-only" for="briefInput">个人简介</label>
                            <textarea id="briefInput" rows="4" v-model="modify.brief"></textarea>
                        </div>
                    </form>
                    <div class="popup-footer">
                        <span>还可以输入：147个字</span>
                        <div class="btn-action pull-right">确定</div>
                        <div class="btn-action pull-right">取消</div>
                    </div>
                </section>
                <section class="popup popup-password" id="popupPwd">
                    <h4 class="popup-header">修改登录密码</h4>
                    <form class="popup-form">
                        <div class="popup-form-item">
                            <label class="sr-only" for="oldPwd">原密码</label>
                            <input id="oldPwd" type="password" placeholder="原密码"/>
                            <i class="iconfont icon-closeEye"></i>
                        </div>
                        <div class="popup-form-item">
                            <label class="sr-only" for="newPwd">新密码:</label>
                            <input id="newPwd" type="password" value="" placeholder="新密码"/>
                            <i class="iconfont icon-closeEye"></i>
                        </div>
                        <div class="popup-form-item">
                            <label class="sr-only" for="newPwdAgain">再次输入新密码:</label>
                            <input id="newPwdAgain" type="password" value="" placeholder="再次输入新密码"/>
                            <i class="iconfont icon-closeEye"></i>
                        </div>
                    </form>
                    <div class="popup-footer">
                        <div class="btn-action pull-right">确定</div>
                        <div class="btn-action pull-right">取消</div>
                    </div>
                </section>
                <section class="popup popup-model">
                    <h4 class="popup-header">显示模式设置</h4>
                    <form class="popup-form">
                        <div class="popup-form-item">
                            <label for="smallFont">小号字体</label>
                            <input id="smallFont" type="radio" name="font" />
                        </div>
                        <div class="popup-form-item">
                            <label for="middleFont">中号字体</label>
                            <input id="middleFont" type="radio" name="font" />
                        </div>
                        <div class="popup-form-item">
                            <label for="bigFont">大号字体</label>
                            <input id="bigFont" type="radio" name="font" />
                        </div>
                    </form>
                    <div class="popup-footer">
                        <div class="btn-action pull-right">确定</div>
                        <div class="btn-action pull-right">取消</div>
                    </div>
                </section>
                <section class="popup popup-head">
                    <h4 class="popup-header">更换头像</h4>

                    <div class="popup-footer">
                        <div class="btn-action pull-right">确定</div>
                        <div class="btn-action pull-right">取消</div>
                    </div>
                </section>
                <section class="popup popup-preview">
                    <div class="model" v-show="model" @click="model = false">
                        <div class="model-show">
                            <img :src="modelSrc" alt="">
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../../components/common/Header"

    let Dialog;
    export default {
        name: "PersonSetting",
        components: {
            HeaderTemp
        },
        data() {
            return {
                model: false,
                modelSrc: "",
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "编辑个人资料",
                        isSearch: false,
                        isSetting: false
                    },
                    picUrl: ""
                },
                // 用户数据对象
                user: {},
                modify: {
                    nickname: "",
                    brief: ""
                }
            }
        },
        created() {
            this.config.picUrl = this.$config.picUrl;
            const user = this.$store.state.user;
            if(!user.account) {
                const promise = this.$request.getUserInfo('879646529', '123456');
                promise.then(data => {
                    this.user = JSON.parse(data);
                    this.$store.state.user = JSON.parse(data);
                }).catch(error => {
                    console.log(error);
                })
            } else {
                this.user = user;
            }
        },
        mounted() {
            Dialog = this.$module.get("Dialog");
            let $iconPwd = $("#popupPwd").find(".iconfont");
            $iconPwd.on("click", (event) => {
                const $target = $(event.target);
                if($target.hasClass("icon-closeEye")) {
                    $target.attr("class", "iconfont icon-find")
                        .prev().attr("type", "input");
                } else {
                    $target.attr("class", "iconfont icon-closeEye")
                        .prev().attr("type", "password");
                }
            });
        },
        methods: {
            preview() {
                Dialog.open('.popup-preview', {
                    isCover: true,
                    width: "80%",
                    height: 400
                });
                // this.$refs.cropper.getCropData((data) => {
                //     this.model = true;
                //     this.modelSrc = data;
                // })
            },
            goTo(page, param) {
                this.$router.push({
                    name: page,
                    param: param
                })
            },
            /**
             * 开启弹窗
             * @param con 弹窗容器
             */
            open(con) {
                const height = $(con).height() + 40;  // 40 为 padding 值
                Dialog.open(con, {
                    isCover: true,
                    width: "80%",
                    height: height
                });
                switch(con) {
                    case ".popup-nickname": {
                        this.modify.nickname = this.user.nickname;
                        break;
                    }
                    case ".popup-brief": {
                        this.modify.brief = this.user.brief;
                        break;
                    }
                }
                console.log(this.modify);
            }
        }
    }
</script>

<style scoped lang="scss">
    .con-setting {

        .setting-item {

            h5 {
                padding: 10px 0;
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
    .con-popup {

        .popup {
            display: none;
            width: 80%;
            height: auto;
            padding: 20px;
            background-color: #fff;

            .popup-header {
                margin: 0 0 10px;
            }
            .popup-form {

                .popup-form-item {
                    width: 100%;
                    height: auto;
                    padding: 2px 0;
                    margin-bottom: 10px;
                    border-bottom: 1px solid $colorMain;

                    input {
                        width: 85%;
                        min-width: 210px;
                        height: 26px;
                        line-height: 26px;
                        border: none;
                        outline: none;
                        padding-left: 2px;
                    }
                    textarea {
                        width: 100%;
                        border: none;
                        outline: none;
                    }
                    .iconfont {
                        font-size: 20px;
                        padding-right: 4px;
                        float: right;
                    }
                }
            }
            .popup-footer {
                width: 100%;
                height: 30px;
                line-height: 30px;
                margin-top: 10px;

                .btn-action {
                    color: $colorMain;
                    margin-left: 20px;
                }
            }
        }
        .popup-model {

            input {
                width: 20px !important;
                min-width: 20px !important;
                height: 20px !important;
                float: right;
            }
        }
    }
</style>
