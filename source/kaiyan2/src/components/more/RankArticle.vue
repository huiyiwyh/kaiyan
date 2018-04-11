<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="con-tab clearfix">
            <ul class="tab-list clearfix">
                <li class="tab-item active" data-slide-to="0">24H热门</li>
                <li class="tab-item" data-slide-to="1">7日热门</li>
                <li class="tab-item" data-slide-to="2">30日热门</li>
            </ul>
            <div class="swiper-container" id="swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <article-list-temp :article="article"></article-list-temp>
                    </div>
                    <div class="swiper-slide">
                        <article-list-temp :article="article"></article-list-temp>
                    </div>
                    <div class="swiper-slide">
                        <article-list-temp :article="article"></article-list-temp>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import "swiper/dist/css/swiper.min.css"
    import Swiper from "swiper/dist/js/swiper.min"
    import HeaderTemp from "@/components/common/Header"
    import ArticleListTemp from "@/components/common/ArticleList"

    import Article from "@/common/data/more/rankArticle"

    let mySwiper;
    export default {
        name: "RankArticle",
        components: {
            HeaderTemp,
            ArticleListTemp
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "排行榜",
                        isSetting: false,
                        isSearch: false
                    }
                },
                article: {
                    type: "recommend",
                    data: Article.data
                },
            }
        },
        mounted() {
            this.$nextTick(function() {
                mySwiper = new Swiper('#swiper', {
                    direction: 'horizontal',
                    on: {
                        slideChange: function () {
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
                $("#swiper").height($(window).height() - 80);
            })
        }
    }
</script>

<style scoped lang="scss">
    .con-tab {
        width: 100%;
        height: 40px;
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
</style>
