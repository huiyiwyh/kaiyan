<template>
    <div class="recommend">
        <header class="normal more">
            <h3 class="font-title pull-left active">推荐</h3>
            <h3 class="font-title pull-left ml-15">专题</h3>
            <i @click="goTo('searchMain')" class="iconfont icon-search pull-right"></i>
        </header>
        <div class="body">
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
                            <ul @click="goToSubject($event)" class="subject-list">
                                <li v-for="item in subject.popular" class="subject-item" data-sid="item.id">
                                    <img :src="picUrl + item.thumbnail"/>
                                    <div v-text="item.name"></div>
                                </li>
                            </ul>
                        </section>
                        <section class="con-new">
                            <ul @click="goToSubject($event)" class="subject-list">
                                <li v-for="item in subject.new" class="subject-item" data-sid="item.id">
                                    <img :src="picUrl + item.thumbnail"/>
                                    <div v-text="item.name"></div>
                                </li>
                            </ul>
                        </section>
                    </div>
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
                subject: {
                    popular: [],
                    new: []
                },
                picUrl: this.$config.picUrl
            }
        },
        created() {
            const promiseForSubjectPopular = this.$request.getSubjectList(1, '', '2018-04-21 16:20:32', '123456'),
                promiseForSubjectNew = this.$request.getSubjectList(2, '', '2018-04-21 17:04:15', '123456');
            promiseForSubjectPopular.then(data => {
                const _data = JSON.parse(data);
                if (Number(_data.code) === 1) {
                    this.subject.popular = _data.data;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(err => {
                console.log(err);
            });
            promiseForSubjectNew.then(data => {
                const _data = JSON.parse(data);
                if (Number(_data.code) === 1) {
                    this.subject.new = _data.data;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(err => {
                console.log(err);
            })
        },
        mounted() {
            let length = 2;
            for (let loop = 0; loop < length; loop++) {
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
        },
        methods: {
            goTo(page, param) {
                this.$router.push({
                    name: page,
                    param: param
                })
            },
            goToSubject(event) {
                let $target;
                if(event.target.tagName === 'LI') {
                    $target = $(event.target);
                } else {
                    $target = $(event.target).parent();
                }
                this.goTo('subject', {
                    id: $target.attr("data-sid")
                })
            }
        }
    }
</script>

<style scoped lang="scss">
    .recommend {
        background-color: #eeeeee;
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
        padding-bottom: 20px;
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
