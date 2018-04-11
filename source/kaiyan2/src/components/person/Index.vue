<template>
    <div class="con">
        <header-temp :config="config.header"></header-temp>
        <div class="con-back" id="back"></div>
        <div class="con-info">
            <div class="info-head">
                <img :src="'http://115.159.59.72/' + user.head" alt="head"/>
            </div>
            <div class="info-basic">
                <div class="font-18 font-bold" v-text="user.nickname"></div>
                <div>
                    <span v-text="user.countFocus"></span>&nbsp;<span>关注</span>
                    <span v-text="user.countFans"></span>&nbsp;<span>粉丝</span>
                </div>
            </div>
            <div class="info-brief" v-text="user.brief"></div>
            <div class="info-other">
                写了&nbsp;<span v-text="user.countWords"></span>&nbsp;字，
                获得了&nbsp;<span v-text="user.countLiked"></span>&nbsp;个喜欢
            </div>
            <div class="info-operation">
                <div class="btn btn-primary pull-left">+ 关注</div>
                <div class="btn btn-default pull-right">传音</div>
            </div>
        </div>
        <div class="con-tab">
            <ul class="tab-list clearfix">
                <li class="tab-item active" data-slide-to="0">动态</li>
                <li class="tab-item" data-slide-to="1">文章</li>
                <li class="tab-item" data-slide-to="2">更多</li>
            </ul>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="tab-action" id="tabAction">
                            <ul class="action-list">
                                <li class="action-item" v-for="item in actions">
                                    <div v-if="item.type === 0">
                                        <div class="action-pic">
                                            <i class="iconfont icon-focus"></i>
                                        </div>
                                        <div class="action-content">
                                            <div class="action-body">
                                                <span>关注了</span>&nbsp;
                                                <span class="action-value" v-text="item.value"></span>
                                            </div>
                                            <div class="action-date" v-text="item.date"></div>
                                        </div>
                                    </div>
                                    <div v-else-if="item.type === 1">
                                        <div class="action-pic">
                                            <i class="iconfont icon-like"></i>
                                        </div>
                                        <div class="action-content">
                                            <div class="action-body">
                                                <span>喜欢了</span>&nbsp;
                                                <span class="action-value" v-text="item.value"></span>
                                            </div>
                                            <div class="action-date" v-text="item.date"></div>
                                        </div>
                                    </div>
                                    <div v-else-if="item.type === 2">
                                        <div class="action-pic">
                                            <i class="iconfont icon-edit"></i>
                                        </div>
                                        <div class="action-content">
                                            <div class="action-body">
                                                <span>发表了</span>&nbsp;
                                                <span class="action-value" v-text="item.value"></span>
                                            </div>
                                            <div class="action-date" v-text="item.date"></div>
                                        </div>
                                    </div>
                                    <div v-else-if="item.type === 3">
                                        <div class="action-pic">
                                            <i class="iconfont icon-subscribe"></i>
                                        </div>
                                        <div class="action-content">
                                            <div class="action-body">
                                                <span>订阅了</span>&nbsp;
                                                <span class="action-value" v-text="item.value"></span>
                                            </div>
                                            <div class="action-date" v-text="item.date"></div>
                                        </div>
                                    </div>
                                    <div v-else-if="item.type === 4">
                                        <div class="action-pic">
                                            <i class="iconfont icon-comment"></i>
                                        </div>
                                        <div class="action-content">
                                            <div class="action-body">
                                                <span>评论了</span>&nbsp;
                                                <span class="action-value" v-text="item.value"></span>
                                            </div>
                                            <div class="action-date" v-text="item.date"></div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="action-back" id="actionBack"></div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="tab-article">
                            <section class="con-header">
                                <div class="header-article">
                                    文章数&nbsp;
                                    <span v-text="user.countArticle"></span>
                                </div>
                                <div class="dropdown" id="menu">
                                    <button class="btn btn-default dropdown-toggle">
                                        <span v-text="choice.title"></span>
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li @click="choose(0)"><a href="javascript:;">最新文章</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li @click="choose(1)"><a href="javascript:;">热门文章</a></li>
                                    </ul>
                                </div>
                            </section>
                            <article-list-temp :article="article"></article-list-temp>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="tab-more">
                            <section class="con-info">
                                <ul class="info-list">
                                    <li @click="goTo('personMyArticle')" class="info-item">
                                        <i class="iconfont icon-book"></i>
                                        <span>文章</span>
                                        <span v-text="user.countArticle"></span>
                                    </li>
                                    <li @click="goTo('personMySubject')" class="info-item">
                                        <i class="iconfont icon-subject"></i>
                                        <span>专题</span>
                                        <span v-text="user.countSubject"></span>
                                    </li>
                                    <li @click="goTo('personMyFocusAuthor')" class="info-item">
                                        <i class="iconfont icon-focus"></i>
                                        <span>关注</span>
                                        <span v-text="user.countFocus"></span>
                                    </li>
                                    <li @click="goTo('personMyFans')" class="info-item">
                                        <i class="iconfont icon-fans"></i>
                                        <span>粉丝</span>
                                        <span v-text="user.countFans"></span>
                                    </li>
                                </ul>
                            </section>
                            <section class="con-list">
                                <ul class="list-group">
                                    <li @click="goTo('personMyLike')" class="list-group-item no-radius">
                                        <i class="iconfont icon-like"></i>
                                        <span class="badge" v-text="user.countLike"></span>
                                        <div>喜欢的文章</div>
                                    </li>
                                    <li @click="goTo('personMyFocusSubject')" class="list-group-item no-radius">
                                        <i class="iconfont icon-subject"></i>
                                        <span class="badge" v-text="user.countSubject"></span>
                                        <div>关注的专题</div>
                                    </li>
                                </ul>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import "jquery-backstretch"
    import "swiper/dist/css/swiper.min.css"
    import "animate.css/animate.min.css"
    import Swiper from "swiper/dist/js/swiper.min"
    import HeaderTemp from "@/components/common/Header"
    import ArticleListTemp from "@/components/common/ArticleList"
    import User from "@/common/data/userIndex.json" // 挡板数据
    import Article from "@/common/data/myArticle.json"
    import Action from '@/common/data/action.json'

    let mySwiper;

    export default {
        name: "PersonIndex",
        components: {
            ArticleListTemp,
            HeaderTemp
        },
        data()  {
            return {
                config: {
                    header: {
                        style: "transparent",
                        isBack: true,
                        title: "",
                        isSearch: true,
                        isSetting: false
                    },
                    reqUrl: {}
                },
                user: {},
                choice: {
                    title: '最新文章',
                    option: 0
                },
                article: {
                    type: "my",
                    data: []
                },
                actions: {}
            }
        },
        created() {
            this.config.reqUrl = this.$config.url.person;
            this.user = this.$store.state.user;
            const promiseAction = this.$ajax.get(
                this.config.reqUrl.getAction,
                ["nhcjs=879646529", "asxcd=2018-03-05 18:18"],
                "123456"
            );
            promiseAction.then(resp => {
                const resp_json = JSON.parse(resp);
                if(Number(resp_json.code) === 1) {
                    this.actions = resp_json.data;
                } else {
                    console.log(resp_json.msg);
                }
            }).catch(error => {
                console.warn("Failed:" + error);
            }).then(function() {
                $("#actionBack").height($("#tabAction").height());
            });
        },
        mounted() {
            $("#back").backstretch("../../assets/back.jpg");
            $("#menu").on("click", function (e) {
                let target = e.target;
                if (target.tagName === "SPAN" || target.tagName === "BUTTON") {
                    $(this).find(".dropdown-menu").slideDown(500);
                } else if (target.tagName === "A") {
                    $(this).find(".dropdown-menu").slideUp(500);
                }
            });
            let _this = this;
            mySwiper = new Swiper('.swiper-container', {
                direction: 'horizontal',
                on: {
                    slideChange: function () {
                        let tabItem = $(".tab-item").siblings().removeClass("active")
                            .get(mySwiper.activeIndex);
                        tabItem.classList.add("active");
                        if(mySwiper.activeIndex === 1) {
                            console.log(_this.article.data.length);
                            if(_this.article.data.length === 0) {
                                const promiseArticle = _this.$ajax.get(
                                    _this.config.reqUrl.getArticle,
                                    ["dhcjs=2", "utysh=1", "idonx=2018-03-05 18:18"],
                                    "123456"
                                );
                                promiseArticle.then(resp => {
                                    const resp_json = JSON.parse(resp);
                                    if(Number(resp_json.code) === 1) {
                                        _this.article.data = resp_json.data;
                                    } else {
                                        console.log(resp_json.msg);
                                    }
                                }).catch(error => {
                                    console.warn(error);
                                })
                            }
                        }
                    }
                }
            });
            $(".tab-list").on("click", function (e) {
                let target = $(e.target);
                target.addClass("active")
                    .siblings().removeClass("active");
                mySwiper.slideTo(target.data("slideTo"), 500, false);
            });
            $(".swiper-container").height($(window).height() - 330);
        },
        methods: {
            choose(option) {
                if (Number(option) === 0) {
                    this.choice.title = "最新文章";
                } else {
                    this.choice.title = "热门文章";
                }

                this.choice.option = option;
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
    .con-back {
        width: 100%;
        height: 120px;
        background: url("../../assets/back.jpg") center center no-repeat;
    }
    .con-info {
        position: relative;
        width: 100%;
        height: 170px;
        background-color: #fff;
        padding: 10px 25px;

        .info-head {
            width: 80px;
            height: 80px;
            position: absolute;
            top: -20px;
            padding: 2px;
            background-color: #fff;
            border-radius: 40px;

            img {
                width: 100%;
                height: 100%;
                border-radius: 50%;
            }
        }
        .info-basic {
            position: relative;
            left: 95px;
            width: 65%;
            min-width: 215px;
            height: 50px;
            @include ellipsis;

            span {
                font-size: 14px;
            }
            span:nth-of-type(even) {
                color: $colorFontIntro;
            }
        }
        .info-brief {
            width: 100%;
            height: 30px;
            margin-top: 5px;
            line-height: 30px;
            font-weight: bold;
            clear: left;
            @include ellipsis;
        }
        .info-other {
            height: 20px;
            line-height: 20px;
            color: $colorFontIntro;
        }
        .info-operation {
            height: 30px;
            margin-top: 10px;

            div {
                width: 140px;
            }
        }
    }
    .con-tab {
        width: 100%;
        height: 40px;
        border-top: 1px solid $colorBorder;
        border-bottom: 1px solid $colorBorder;
        background-color: #fff;

        .tab-list {
            padding: 0 25px;

            .tab-item {
                width: 33%;
                height: 40px;
                line-height: 40px;
                float: left;
                text-align: center;
                font-weight: bold;
            }
            .active {
                color: $colorMain;
                border-bottom: 2px solid $colorMain;
            }
        }
        .swiper-slide {
            overflow: auto;
        }
    }

    .tab-action {

        .action-list {
            padding: 5px 25px 10px;

            .action-item {
                width: 100%;
                height: auto;
                overflow: hidden;
                padding: 10px 0;

                .action-pic {
                    width: 30px;
                    height: 30px;
                    border: 1px solid #666;
                    border-radius: 15px;
                    text-align: center;
                    line-height: 30px;
                    float: left;
                    background-color: #fff;

                    i {
                        font-size: 20px;
                    }
                }
                .action-content {
                    width: 75%;
                    min-width: 270px;
                    float: left;
                    margin-left: 10px;

                    .action-value {
                        color: $colorMain;
                    }
                    .action-date {
                        font-size: 12px;
                        color: $colorFontIntro;
                    }
                }
            }
        }
        .action-back {
            position: absolute;
            top: 0;
            left: 40px;
            z-index: -1;
            border-left: 1px solid #666;
        }
    }
    .tab-article {

        .con-header {
            height: 40px;
            padding: 0 10px;

            .header-article {
                height: 100%;
                line-height: 40px;
                color: $colorMain;
                float: left;
            }
            .dropdown {
                width: 100px;
                margin-top: 5px;
                float: right;

                .dropdown-toggle {
                    width: 100px;
                }
                .dropdown-menu {
                    width: 100px;
                    min-width: 100px;

                    li {
                        height: 30px;
                        line-height: 30px;
                    }
                    .divider {
                        height: 1px;
                        line-height: 1px;
                        margin: 0;
                    }
                }
            }
        }
    }
    .tab-more {
        .con-info {
            position: relative;
            height: 100px;

            .info-list {
                height: 100%;
                padding: 15px 0;

                .info-item {
                    width: 25%;
                    float: left;
                    text-align: center;

                    i {
                        display: block;
                        font-size: 30px;
                    }
                }
            }
        }
        .con-list {
            height: 100px;

            .list-group {
                padding-left: 0;
                margin-bottom: 20px;
            }
            .list-group-item {
                height: 50px;
                line-height: 28px;
                padding: 10px 15px;
                margin-bottom: -1px;

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
    }
</style>
