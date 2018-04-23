<template>
    <div class="con-popup">
        <section v-if="popup.type === 'nickname'" class="popup popup-nickname">
            <h4 class="popup-header">修改昵称</h4>
            <form class="popup-form">
                <div class="popup-form-item">
                    <label class="sr-only" for="nicknameInput">用户昵称</label>
                    <input id="nicknameInput" type="text" value="游学者、墨槿"/>
                </div>
            </form>
            <div class="popup-footer">
                <div class="btn-action pull-right">确定</div>
                <div class="btn-action pull-right">取消</div>
            </div>
        </section>
        <section v-else-if="popup.type === 'brief'" class="popup popup-brief">
            <h4 class="popup-header">编辑个人简介</h4>
            <form class="popup-form">
                <div class="popup-form-item">
                    <label class="sr-only" for="briefInput">个人简介</label>
                    <textarea id="briefInput" rows="4"></textarea>
                </div>
            </form>
            <div class="popup-footer">
                <span>还可以输入：147个字</span>
                <div class="btn-action pull-right">确定</div>
                <div class="btn-action pull-right">取消</div>
            </div>
        </section>
        <section v-else-if="popup.type === 'password'" class="popup popup-password" id="popupPwd">
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
    </div>
</template>

<script type="text/ecmascript-6">

    export default {
        name: "Popup",
        data() {
            return {

            }
        },
        props: ["popup"]
    }
</script>

<style scoped lang="scss">
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
        .popup-password {

        }
    }
</style>
