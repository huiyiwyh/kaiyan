<template>
    <div class="recommend">
        <header class="normal">
            <h3 class="font-title pull-left active">推荐</h3>
            <h3 class="font-title pull-left ml-15">专题</h3>
            <i @click="goTo('searchMain')" class="iconfont icon-search pull-right"></i>
        </header>
        <div class="swiper-container" id="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <section class="con-list">
                        <ul class="info-list">
                            <li @click="goTo('rankArticle')" class="info-item">
                                <i class="iconfont icon-rank"></i>
                                <span>排行榜</span>
                            </li>
                            <li @click="goTo('rankAuthor')" class="info-item">
                                <i class="iconfont icon-author"></i>
                                <span>作者榜</span>
                            </li>
                        </ul>
                    </section>
                    <section class="con-body" id="conBody">
                        <article-list-temp :article="article"></article-list-temp>
                    </section>
                </div>
                <div class="swiper-slide" style="overflow: auto;">
                    <section class="con-carousel">
                        <div class="swiper-container" id="carousel">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <!--<img src="../../assets/test1.jpg" />-->
                                </div>
                                <div class="swiper-slide">
                                    <!--<img src="../../assets/test1.jpg" />-->
                                </div>
                                <div class="swiper-slide">
                                    <!--<img src="../../assets/back.jpg" />-->
                                </div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </section>
                    <section class="con-subject">
                        <ul class="subject-list">
                            <li v-for="item in subjects" @click="goTo('subject')" class="subject-item">
                                <img :src="picUrl + item.thumbnail" />
                                <div v-text="item.name"></div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>移动端开发</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>旅游</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>前端之路</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>移动端开发</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>旅游</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>前端之路</div>
                            </li>
                        </ul>
                    </section>
                    <section class="con-new">
                        <ul class="subject-list">
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>前端之路</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>移动端开发</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>旅游</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>前端之路</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>移动端开发</div>
                            </li>
                            <li @click="goTo('subject')" class="subject-item">
                                <img src="../../assets/back.jpg" />
                                <div>旅游</div>
                            </li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import "swiper/dist/css/swiper.min.css"
    import Swiper from "swiper/dist/js/swiper.min"
    import ArticleListTemp from "../common/ArticleList"

    import article from "../../common/data/more/article"
    import subject from "../../common/data/more/subjectList"

    let mySwiper;
    let myCarousel;
    let scrollTops = [];
    export default {
        name: "MoreRecommend",
        components: {
            ArticleListTemp
        },
        data() {
            return {
                article: {
                    type: 'recommend',
                    data: article.data
                },
                subjects: subject.data ,
                picUrl: this.$config.picUrl
            }
        },
        mounted() {
            this.$nextTick(function() {
                let length = 2;
                for(let loop = 0; loop < length; loop++) {
                    scrollTops[loop] = 0;
                }
                mySwiper = new Swiper('#swiper', {
                    direction: 'horizontal',
                    on: {
                        slideChange: function () {
                            let $conBody = $("#conBody");
                            let tabItem = $(".normal").find("h3").siblings().removeClass("active")
                                .get(mySwiper.activeIndex);
                            tabItem.classList.add("active");
                            scrollTops[mySwiper.previousIndex] = $conBody.scrollTop();
                            $conBody.scrollTop(scrollTops[mySwiper.activeIndex]);
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
                myCarousel = new Swiper("#carousel", {
                    direction: 'horizontal',
                    loop: true,
                    autoplay: {
                        delay: 5000,
                        stopOnLastSlide: false,
                        disableOnInteraction: true
                    },
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true
                    }
                });
                $("#swiper").height($(window).height() - 90);
                $("#conBody").height($(window).height() - 215);
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
    @import "../../common/scss/common";

    .recommend {
        background-color: #eeeeee;
    }
    .normal {
        width: 100%;
        height: 40px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;
        line-height: 20px;

        h3 {
            display: inline-block;
            width: 60px;
            height: 30px;
            margin: 0;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
        }
        .active {
            color: #0099cc;
            border-bottom: 2px solid #0099cc;
        }
        .iconfont {
            font-size: 20px;
            font-weight: bold;
            margin-right: 10px;
        }
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
    .con-body {
        margin-top: 15px;
        background-color: #fff;
        overflow: auto;
    }
    .con-carousel {
        height: 150px;

        .swiper-slide {
            width: 100%;
            height: 150px;
            background: url("../../assets/test1.jpg") center no-repeat;
        }
        img {
            height: 130px;
        }
    }
    .con-new,
    .con-subject {
        margin-top: 15px;
        background-color: #fff;

        .subject-list {
            height: auto;
            padding: 15px 15px 0;
            overflow: hidden;

            .subject-item {
                width: 33%;
                height: auto;
                margin-bottom: 15px;
                text-align: center;
                float: left;

                img {
                    width: 80px;
                    height: 80px;
                    border-radius: 10px;
                }
                div {
                    margin-top: 5px;
                    font-weight: bold;
                    @include ellipsis;
                }
            }
        }
    }
    .con-subject {
        margin-top: 0;
    }
</style>
