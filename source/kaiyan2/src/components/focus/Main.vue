<template>
    <div>
        <header class="normal">
            <h3 class="font-title pull-left">关注</h3>
            <i @click="goTo('searchMain')" class="iconfont icon-search pull-right"></i>
            <i @click="goTo('focusRecommend')" class="iconfont icon-focus pull-right"></i>
        </header>
        <section class="con-tab">
            <ul class="tab-list">
                <li class="tab-item active" data-slide-to="0">作者</li>
                <li class="tab-item" data-slide-to="1">专题</li>
            </ul>
        </section>
        <section class="con-body" id="conBody">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <author-list-temp :author="author"></author-list-temp>
                    </div>
                    <div class="swiper-slide">
                        <subject-list-temp :subject="subject"></subject-list-temp>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    import "swiper/dist/css/swiper.min.css"
    import Swiper from "swiper/dist/js/swiper.min"
    import AuthorListTemp from "@/components/common/AuthorList"
    import SubjectListTemp from "@/components/common/SubjectList"

    import authorFocus from "../../common/data/focus/authorFocus"
    import subjectList from "../../common/data/focus/subjectList"

    let mySwiper;
    export default {
        name: "FocusMain",
        components: {
            AuthorListTemp,
            SubjectListTemp
        },
        data() {
            return {
                author: {
                    type: 'focus',
                    data: authorFocus.data
                },
                subject: {
                    type: "focus",
                    data: subjectList.data
                }
            }
        },
        mounted() {
            this.$nextTick(function() {
                mySwiper = new Swiper('.swiper-container', {
                    direction: 'horizontal',
                    on: {
                        slideChange: function () {
                            let $conBody = $("#conBody");
                            let tabItem = $(".tab-item").siblings().removeClass("active")
                                .get(mySwiper.activeIndex);
                            tabItem.classList.add("active");
                        },
                        touchEnd: function(swiper) {
                            //下拉加载
                            if (swiper.isEnd) {
                                LoadingMore();//加载更多
                            }
                            //上拉刷新
                            if (swiper.translate > 0) {
                                console.log("haha");
                                window.location.reload();//这里应该是根据不同的tab加载不同的方法
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
                $("#conBody").height($(window).height() - 130);
            })
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
    header {
        width: 100%;
        height: 40px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;
        line-height: 20px;

        h3 {
            margin: 0;
            font-size: 20px;
            font-weight: bold;
        }
        .iconfont {
            font-size: 20px;
            font-weight: bold;
            margin-right: 10px;
        }
        .button {
            color: #0099cc;
            display: none;
        }
    }
    .con-tab {
        height: 40px;
        padding: 5px 10px;
        border-bottom: 1px solid $colorBorder;

        .tab-list {
            width: auto;
            height: 30px;

            .tab-item {
                height: 100%;
                line-height: 30px;
                padding: 0 15px;
                float: left;
            }
            .active {
                background-color: $colorMain;
                color: #fff;
                border-radius: 15px;
            }
        }
    }
    .con-body {

        .swiper-container {
            height: 100%;
        }
        .swiper-slide {
            overflow: auto;
        }
    }
</style>
