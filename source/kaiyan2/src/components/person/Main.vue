<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="con body">
            <section @click="goTo('personIndex')" class="con-person">
                <div class="person-head pull-left">
                    <img :src="'http://115.159.59.72/' + user.head" alt="head" />
                </div>
                <div class="person-info pull-left">
                    <div class="font-primary" v-text="user.nickname"></div>
                    <div class="font-intro" v-text="user.brief"></div>
                </div>
            </section>
            <section class="con-content">
                <ul class="list-group">
                    <li @click="goTo('personMyFocusAuthor')" class="list-group-item no-radius">
                        <i class="iconfont icon-focus"></i>
                        <span class="badge" v-text="user.countFocus"></span>
                        <div>我的关注</div>
                    </li>
                    <li @click="goTo('personMyFans')" class="list-group-item">
                        <i class="iconfont icon-fans"></i>
                        <span class="badge" v-text="user.countFans"></span>
                        <div>我的粉丝</div>
                    </li>
                    <li @click="goTo('personMyLike')" class="list-group-item">
                        <i class="iconfont icon-like"></i>
                        <span class="badge" v-text="user.countLike"></span>
                        <div>喜欢的文章</div>
                    </li>
                    <li @click="goTo('personMyArticle')" class="list-group-item">
                        <i class="iconfont icon-article"></i>
                        <span class="badge" v-text="user.countArticle"></span>
                        <div>我的文章</div>
                    </li>
                    <li @click="goTo('personMyFocusSubject')" class="list-group-item">
                        <i class="iconfont icon-sure"></i>
                        <span class="badge" v-text="user.countSubject"></span>
                        <div>关注的专题</div>
                    </li>
                    <li @click="goTo('personMySubject')" class="list-group-item">
                        <i class="iconfont icon-subject"></i>
                        <div>我的专题</div>
                    </li>
                    <li @click="goTo('personMyHistory')" class="list-group-item">
                        <i class="iconfont icon-clock"></i>
                        <div>浏览记录</div>
                    </li>
                    <li class="list-group-item">
                        <i class="iconfont icon-moon"></i>
                        <div>夜间模式</div>
                    </li>
                    <li class="list-group-item">
                        <i class="iconfont icon-alert"></i>
                        <div>常见帮助</div>
                    </li>
                </ul>
            </section>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import Header from "@/components/common/Header"
    import {Module} from "@/common/js/common"
    import User from "@/common/data/user.json" // 挡板数据

    export default {
        name: 'PersonMain',
        data: () => {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: false,
                        title: "我的",
                        isSearch: true,
                        isSetting: true
                    },
                    reqUrl: {}
                },
                user: {}
            }
        },
        components: {
            HeaderTemp: Header
        },
        created() {
            this.config.reqUrl = this.$config.url.person;
            // 若 store 仓库中没有用户信息，则向服务器获取用户信息
            if(!this.$store.state.user.account) {
                const promise = this.$request.getUserInfo('879646529', '123456');
                promise.then(data => {
                    this.user = JSON.parse(data);
                    this.$store.state.user = JSON.parse(data);
                }).catch(error => {
                    console.log(error);
                })
            } else {
                this.user = this.$store.state.user;
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
    };
</script>

<style scoped lang="scss">
    .con-person {
        width: 100%;
        height: 70px;
        padding: 10px 15px;
        background-color: #fff;

        .person-head {
            width: 50px;
            height: 50px;

            img {
                width: 100%;
                height: 100%;
                border-radius: 25px;
            }
        }
        .person-info {
            width: 80%;
            min-width: 265px;
            padding-top: 5px;
            margin-left: 15px;

            div {
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
        }
    }
    .con-content {
        width: 100%;
        height: auto;
        margin-top: 20px;

        .list-group-item {
            height: 50px;
            line-height: 28px;

            .iconfont {
                font-size: 24px;
                float: left;
            }
            .badge {
                margin-top: 5px;
            }
            div {
                position: relative;
                left: 10px;
                float: left;
                font-weight: bold;
            }
        }
    }
</style>
