<template>
    <div class="recommend">
        <header-temp :config="config.header"></header-temp>
        <section class="con-search">
            <div class="search-body">
                <i class="iconfont icon-search"></i>
                <span>搜索开眼的专题和作者</span>
            </div>
        </section>
        <section class="con-tab">
            <ul class="tab-list">
                <li class="tab-item active" data-slide-to="0">
                    <i class="iconfont icon-user"></i>
                    <div>推荐作者</div>
                </li>
                <li class="tab-item" data-slide-to="1">
                    <i class="iconfont icon-subject"></i>
                    <div>推荐专题</div>
                </li>
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
    import HeaderTemp from "@/components/common/Header"
    import AuthorListTemp from "@/components/common/AuthorList"
    import SubjectListTemp from "@/components/common/SubjectList"
    import Swiper from "swiper/dist/js/swiper.min"

    import authorView from "../../common/data/authorView"
    import subjectList from "@/common/data/focus/subjectList"

    let mySwiper;
    let scrollTops = [];
    export default {
        name: "FocusRecommend",
        components: {
            HeaderTemp,
            AuthorListTemp,
            SubjectListTemp
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "推荐关注",
                        isSearch: false,
                        isSetting: false
                    }
                },
                author: {
                    type: "recommend",
                    data: authorView.data
                },
                subject: {
                    type: "focus",
                    data: subjectList.data
                }
            }
        },
        created() {
            const Ajax = this.$module.get("Ajax");
            let data =  Ajax.get("115.159.59.72/test.php?search=haha", "123456");
            data.then(function() {
                console.log("haha");
            }).then(function() {
                console.log("hoho");
            })
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
                            scrollTops[mySwiper.previousIndex] = $conBody.scrollTop();
                            $conBody.scrollTop(scrollTops[mySwiper.activeIndex]);
                        }
                    }
                });
                $("#conBody").height($(window).height() - 230);
                $(".tab-list").on("click", function (e) {
                    let target;
                    if(e.target.tagName === 'LI') {
                        target = $(e.target);
                    } else {
                        target = $(e.target).parent();
                    }
                    target.addClass("active")
                        .siblings().removeClass("active");
                    mySwiper.slideTo(target.data("slideTo"), 500, false);
                });
            })
        }
    }
</script>

<style scoped lang="scss">
    .recommend {
        background-color: #eeeeee;
    }
    .con-search {
        height: 50px;
        padding: 5px 10px;
        background-color: #fff;

        .search-body {
            width: 80%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            margin: 0 auto;
            border: 1px solid #797979;
            border-radius: 20px;
            color: $colorFontIntro;
        }
    }
    .con-tab {
        height: 120px;
        border-top: 1px solid $colorBorder;
        border-bottom: 1px solid $colorBorder;
        background-color: #fff;

        .tab-list {
            height: 100%;
            padding: 10px 20px;


            .tab-item {
                float: left;
                width: 50%;
                height: 100%;
                text-align: center;

                i {
                    font-size: 48px;
                }
            }
            .active {
                color: $colorMain;
            }
        }
    }
    .con-body {
        margin-top: 20px;
        background-color: #fff;
        overflow: auto;

        .swiper-container {
            height: 100%;
        }
        .swiper-slide {
            overflow: auto;
        }
    }
</style>
