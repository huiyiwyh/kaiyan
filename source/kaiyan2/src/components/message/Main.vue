<template>
    <div class="message">
        <header-temp :config="config.header"></header-temp>
        <section class="con-list">
            <ul class="info-list">
                <li @click="goTo('messComment')" class="info-item">
                    <i class="iconfont icon-comment"></i>
                    <span>评论</span>
                </li>
                <li @click="goTo('messLike')" class="info-item">
                    <i class="iconfont icon-unlike"></i>
                    <span>喜欢</span>
                </li>
                <li @click="goTo('messFocus')" class="info-item">
                    <i class="iconfont icon-focus"></i>
                    <span>关注</span>
                </li>
                <li @click="goTo('')" class="info-item">
                    <i class="iconfont icon-mess-subject"></i>
                    <span>专题</span>
                </li>
            </ul>
        </section>
        <section class="con-mess">
            <div class="mess-header">
                <span class="font-18">千里传音</span>
                <span @click="goTo('messSend')" class="pull-right">传音</span>
            </div>
            <ul class="mess-list">
                <li @click="goTo('messContent')" class="mess-item">
                    <div class="mess-left">
                        <img :src="'http://115.159.59.72/' + user.head" alt="head" />
                    </div>
                    <div class="mess-right">
                        <div class="mess-name">
                            <span class="font-bold">游学者、墨槿</span>
                            <span class="pull-right">2018-03-12 15:34</span>
                        </div>
                        <div class="mess-content">
                            前言，在Android开发的多线程应用场景中，有任何...
                        </div>
                    </div>
                </li>
                <li @click="goTo('messContent')" class="mess-item">
                    <div class="mess-left">
                        <img :src="'http://115.159.59.72/' + user.head" alt="head" />
                    </div>
                    <div class="mess-right">
                        <div class="mess-name">
                            <span class="font-bold">游学者、墨槿</span>
                            <span class="pull-right">2018-03-12 15:34</span>
                        </div>
                        <div class="mess-content">
                            前言，在Android开发的多线程应用场景中，有任何...
                        </div>
                    </div>
                </li>
            </ul>
            <div class="mess-end">-- end --</div>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "@/components/common/Header"
    import User from "@/common/data/user.json" // 挡板数据

    export default {
        name: "MessageMain",
        components: {
            HeaderTemp,
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: false,
                        title: "消息",
                        isSearch: true,
                        isSetting: true
                    }
                },
                user: User
            }
        },
        methods: {
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
    .message {
        background-color: #eee;
    }
    .con-list {
        position: relative;
        height: 110px;
        background-color: #fff;

        .info-list {
            height: 100%;
            padding: 15px 0;

            .info-item {
                width: 25%;
                height: 80px;
                float: left;
                text-align: center;

                i {
                    display: block;
                    font-size: 40px;
                }
            }
        }
    }
    .con-mess {
        margin-top: 15px;
        background-color: #fff;

        .mess-header {
            padding: 0 10px;
            height: 40px;
            line-height: 40px;
            border-bottom: 1px solid $colorBorder;

            span:last-child {
                color: $colorMain;
            }
        }
        .mess-list {
            padding: 10px;
            margin-bottom: -15px;

            .mess-item {
                height: auto;
                overflow: hidden;
                margin-bottom: 15px;

                .mess-left {
                    width: 50px;
                    height: 50px;
                    float: left;

                    img {
                        width: 40px;
                        height: 40px;
                        border-radius: 20px;
                    }
                }
                .mess-right {
                    width: 75%;
                    min-width: 290px;
                    float: left;
                    padding-bottom: 10px;
                    border-bottom: 1px solid #ccc;

                    .mess-content {
                        @include ellipsis;
                        color: $colorFontIntro;
                    }
                }
            }
        }
        .mess-end {
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
        }
    }
</style>
