<template>
    <div class="con">
        <header-temp :config="config.header"></header-temp>
        <div class="body">
            <section class="con-info">
                <div class="info-head">
                    <img :src="picUrl + subject.thumbnail" alt="head"/>
                </div>
                <div class="info-basic">
                    <div class="font-18 font-bold pt-15" v-text="subject.name"></div>
                    <div class="mt-5">
                        <span class="color-main" v-text="subject.nickname"></span>&nbsp;<span>编</span>
                        <span v-text="subject.countArticle"></span>&nbsp;<span>篇文章</span>
                    </div>
                </div>
                <div class="info-brief" v-text="subject.brief"></div>
                <div class="info-operation">
                    <div class="btn btn-primary pull-left" v-if="config.isMine === true">+ 关注 | <span v-text="subject.countFocus"></span></div>
                    <div class="btn btn-primary pull-left" v-else>管理</div>
                    <div @click.stop="showPanel()" class="btn btn-default pull-right">投稿</div>
                </div>
            </section>
            <section class="con-tab">
                <ul class="tab-list clearfix">
                    <li class="tab-item active" data-slide-to="0">最新投稿</li>
                    <li class="tab-item" data-slide-to="1">最热门</li>
                </ul>
                <div class="swiper-container clearfix">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <article-list-temp :article="article"></article-list-temp>
                        </div>
                        <div class="swiper-slide">
                            <article-list-temp :article="article"></article-list-temp>
                        </div>
                    </div>
                </div>
            </section>
            <section class="panel panel-primary panel-cont" id="panelCont">
                <div class="panel-heading">向专题投稿</div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <span>面朝大海，春暖花开</span>
                        <div class="btn btn-default pull-right">投稿</div>
                    </li>
                    <li class="list-group-item">
                        <span>面朝大海，春暖花开</span>
                        <div class="btn btn-default pull-right">投稿</div>
                    </li>
                    <li class="list-group-item">
                        <span>面朝大海，春暖花开</span>
                        <div class="btn btn-default pull-right">投稿</div>
                    </li>
                    <li class="list-group-item">
                        <span>面朝大海，春暖花开</span>
                        <div class="btn btn-default pull-right">投稿</div>
                    </li>
                    <li class="list-group-item">
                        <span>面朝大海，春暖花开</span>
                        <div class="btn btn-default pull-right">投稿</div>
                    </li>
                    <li class="list-group-item">
                        <span>面朝大海，春暖花开</span>
                        <div class="btn btn-default pull-right">投稿</div>
                    </li>
                    <li class="list-group-item">
                        <span>面朝大海，春暖花开</span>
                        <div class="btn btn-default pull-right">投稿</div>
                    </li>
                    <li class="list-group-item">
                        <span>面朝大海，春暖花开</span>
                        <div class="btn btn-default pull-right">投稿</div>
                    </li>
                </ul>
            </section>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import "swiper/dist/css/swiper.min.css"
    import "animate.css/animate.min.css"
    import Swiper from "swiper/dist/js/swiper.min"
    import HeaderTemp from "@/components/common/Header"
    import ArticleListTemp from "@/components/common/ArticleList"
    import User from "@/common/data/userIndex.json" // 挡板数据
    import Subject from "@/common/data/more/subjectDetail"
    import articleLvyou from "../../common/data/focus/articleForLvyou"

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
                        style: "normal",
                        isBack: true,
                        title: "",
                        isSearch: false,
                        isSetting: false
                    },
                    isMine: false
                },
                subject: {},
                picUrl: this.$config.picUrl,
                article: {
                    type: "other",
                    data: articleLvyou.data
                }
            }
        },
        created() {
            const promise = this.$request.getSubjectInfo(1, '879646528', '123456');
            promise.then(data => {
                const _data = JSON.parse(data);
                if(Number(_data.code) === 1) {
                    this.subject = _data.data.info;
                    this.config.isMine = _data.data.isOwned;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(err => {
                console.log(err);
            })
        },
        mounted() {
            this.$nextTick(function () {
                mySwiper = new Swiper('.swiper-container', {
                    direction: 'horizontal',
                    on: {
                        slideChange: function () {
                            let tabItem = $(".tab-item").siblings().removeClass("active")
                                .get(mySwiper.activeIndex);
                            tabItem.classList.add("active");
                        }
                    }
                });
                $(".swiper-container").height($(window).height() - 250);
                $(".tab-list").on("click", function (e) {
                    e.stopPropagation();
                    let target = $(e.target);
                    target.addClass("active")
                        .siblings().removeClass("active");
                    mySwiper.slideTo(target.data("slideTo"), 500, false);
                });
                $(document).on("click", function() {
                    $("#panelCont").slideUp("slow");
                })

            });
        },
        methods: {
            showPanel() {
                $("#panelCont").slideDown("slow");
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
    .con-info {
        position: relative;
        width: 100%;
        height: 170px;
        background-color: #fff;
        padding: 10px 25px;

        .info-head {
            width: 80px;
            height: 80px;
            float: left;

            img {
                width: 100%;
                height: 100%;
                border-radius: 5px;
            }
        }
        .info-basic {
            width: 65%;
            min-width: 215px;
            height: 70px;
            margin-left: 15px;
            float: left;
            overflow: hidden;

            div {
                @include ellipsis;
            }

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
                width: 50%;
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
    .panel-cont {
        display: none;
        position: fixed;
        bottom: 0;
        z-index: 1000;
        width: 100%;
        height: 341px;
        border-left: none;
        border-right: none;
        margin-bottom: 0;
        background-color: #fff;

        .list-group {
            height: 300px;
            overflow: auto;
        }
        .list-group-item {
            height: 50px;
            line-height: 30px;
        }
    }
</style>
