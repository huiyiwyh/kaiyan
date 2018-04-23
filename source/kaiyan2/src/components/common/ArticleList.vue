<template>
    <!-- 关注模块关注专题页面模板 -->
    <section class="con-article article-other" v-if="article.type === 'other'">
        <article class="article-item" v-for="item in article.data">
            <div class="clearfix">
                <div class="article-left">
                    <div class="article-info">
                        <div class="article-author">
                            <img @click="goTo('personIndex')" :src="picUrl + item.head" alt="head"/>
                            <div class="article-name">
                                <span @click="goTo('personIndex')" class="font-bold" v-text="item.nickname"></span>
                                <br/>
                                <span class="font-12" v-text="item.date"></span>
                            </div>
                        </div>
                        <h3 @click="goTo('article')" v-text="item.title"></h3>
                    </div>
                    <ul class="article-data">
                        <li>
                            <i class="iconfont icon-comment"></i>
                            <span v-text="item.countComment"></span>
                        </li>
                        <li>
                            <i class="iconfont icon-unlike"></i>
                            <span v-text="item.countLike"></span>
                        </li>
                        <li>
                            <i class="iconfont icon-book"></i>
                            <span v-text="item.countRead"></span>
                        </li>
                    </ul>
                </div>
                <div class="article-right">
                    <img :src="picUrl + item.thumbnail" alt="缩略图"/>
                </div>
            </div>
        </article>
    </section>
    <!-- 发现模块推荐页面模板 -->
    <section class="con-article article-reco" v-else-if="article.type === 'recommend'">
        <article class="article-item" v-for="item in article.data">
            <div class="clearfix">
                <div class="article-author">
                    <img @click="goTo('personIndex')" :src="picUrl + item.head" alt="head"/>
                    <span @click="goTo('personIndex')" class="article-name" v-text="item.nickname"></span>
                    <span class="pull-right" v-text="item.date"></span>
                </div>
                <div class="article-info">
                    <h3 @click="goTo('article')" v-text="item.title"></h3>
                    <div class="article-content" v-text="item.content"></div>
                </div>
                <div class="article-right">
                    <img :src="picUrl + item.thumbnail" alt="缩略图"/>
                </div>
            </div>
            <div class="clearfix mt-15">
                <ul class="article-data">
                    <li>
                        <i class="iconfont icon-comment"></i>
                        <span v-text="item.countComment"></span>
                    </li>
                    <li>
                        <i class="iconfont icon-unlike"></i>
                        <span v-text="item.countLike"></span>
                    </li>
                    <li>
                        <i class="iconfont icon-book"></i>
                        <span v-text="item.countRead"></span>
                    </li>
                </ul>
                <div class="btn btn-default article-subject" v-if="item.sid === 0">尚未投稿</div>
                <div @click="goTo('subject')" class="btn btn-default article-subject" v-else
                     v-text="item.subjectName"></div>
            </div>
        </article>
    </section>
    <!-- 我的模块文章列表模板 -->
    <section class="con-article swiper-container" v-else-if="article.type === 'my'">
        <div class="swiper-wrapper">
            <article class="swiper-slide article-item" v-for="item in article.data">
                <div class="clearfix">
                    <div class="article-info">
                        <div class="article-date" v-text="item.date"></div>
                        <h3 @click="goTo('article')" v-text="item.title"></h3>
                    </div>
                    <div class="article-right">
                        <img src="../../assets/back.jpg" alt="缩略图"/>
                    </div>
                </div>
                <div class="clearfix mt-15">
                    <ul class="article-data">
                        <li>
                            <i class="iconfont icon-comment"></i>
                            <span v-text="item.countComment"></span>
                        </li>
                        <li>
                            <i class="iconfont icon-unlike"></i>
                            <span v-text="item.countLike"></span>
                        </li>
                        <li>
                            <i class="iconfont icon-book"></i>
                            <span v-text="item.countRead"></span>
                        </li>
                    </ul>
                    <div class="btn btn-default article-subject" v-if="item.sid === 0">尚未投稿</div>
                    <div @click="goTo('subject')" class="btn btn-default article-subject" v-else
                         v-text="item.subjectName"></div>
                </div>
            </article>
        </div>
    </section>
</template>

<script type="text/ecmascript-6">
    import Swiper from "swiper/dist/js/swiper.min"

    export default {
        name: "ArticleListTemplate",
        props: ["article"],
        data() {
            return {
                picUrl: this.$config.picUrl
            }
        },
        mounted() {
            let refreshEnd = false,
                times = 0, //加载次数
                oriSpeed = 300;
            $(".con-article").height($(window).height() - 40);
            // let swiper = new Swiper('.swiper-container', {
            //     speed: oriSpeed,
            //     slidesPerView: 'auto',
            //     freeMode: true,
            //     direction: 'vertical',
            //     // setWrapperSize: true,
            //     on: {
            //         //下拉释放刷新
            //         touchEnd: function () {
            //             swiper = this;
            //             let refreshText = swiper.$el.find('.refreshText')
            //             console.log(swiper.translate);
            //             if(this.translate > 100) {
            //                 swiper.setTransition(this.params.speed);
            //                 swiper.setTranslate(100);
            //                 swiper.touchEventsData.isTouched = false;//跳过touchEnd事件后面的跳转(4.0.5)
            //                 refreshText.html('刷新中')
            //
            //                 swiper.allowTouchMove = false;
            //                 setTimeout(function () {
            //                     // swiper.removeAllSlides();
            //                     refreshText.html('刷新完成');
            //                     refreshEnd = true;
            //                     swiper.allowTouchMove = true;
            //                 }, 1000)
            //
            //             }
            //
            //         },
            //         touchStart: function () {
            //             if(refreshEnd === true) {
            //                 this.$el.find('.refreshText').html('释放刷新');
            //                 refreshEnd = false;
            //             }
            //         },
            //
            //         //加载更多
            //         momentumBounce: function () {//非正式反弹回调函数，上拉释放加载更多可参考上例
            //             swiper = this;
            //             if (swiper.translate < -100) {
            //                 swiper.allowTouchMove = false;//禁止触摸
            //                 swiper.params.virtualTranslate = true;//定住不给回弹
            //                 setTimeout(function () {
            //                     for (let m = 0; m < 20; m++) {
            //                         swiper.appendSlide('<div class="swiper-slide">moreSlide' + (times * 20 + m + 1) + '</div>');
            //                     }
            //                     swiper.params.virtualTranslate = false;
            //                     swiper.allowTouchMove = true;
            //                     times++
            //                 }, 1000)
            //
            //             }
            //         },
            //     }
            // });
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
    .con-article {
        background-color: #fff;
        overflow: auto;

        .article-item {
            height: auto;
            padding: 10px;
            /*<!--border-top: 1px solid $colorBorder;-->*/
            border-bottom: 1px solid $colorBorder;
            overflow: hidden;

            .article-info {
                width: 60%;
                min-width: 220px;
                float: left;

                .article-date {
                    position: relative;
                    top: 5px;
                    color: $colorFontIntro;
                }
                .article-author {
                    height: 50px;

                    img {
                        position: relative;
                        top: 5px;
                        width: 40px;
                        height: 40px;
                        border-radius: 20px;
                        display: block;
                        float: left;
                    }
                    .article-name {
                        position: relative;
                        top: 7px;
                        margin-left: 50px;
                        @include ellipsis;
                    }
                }
                h3 {
                    width: 100%;
                    height: 55px;
                    @include ellipsis-more-3;
                    margin: 20px 0 0;
                    font-size: 18px;
                    font-weight: bold;
                }
            }
            .article-right {
                width: 30%;
                min-width: 100px;
                float: right;
                text-align: right;

                img {
                    width: 100px;
                    height: 100px;
                    border-radius: 5px;
                }
            }
            .article-data {
                height: 30px;
                line-height: 30px;
                float: left;
                overflow: hidden;

                li {
                    margin-right: 5px;
                    float: left;
                    font-size: 16px;
                }
            }
            .article-subject {
                max-width: 45%;
                @include ellipsis;
                float: right;
            }
        }
    }

    .article-other {

        .article-item {

            .article-left {
                width: 55%;
                min-width: 220px;
                float: left;
            }

            .article-info {

                h3 {
                    height: 40px;
                    line-height: 20px;
                    margin-top: 10px !important;
                    @include ellipsis-more-2;
                }
            }
            .article-right {
                width: 35%;
                min-width: 110px;
                padding-top: 10px;

                img {
                    width: 110px;
                    height: 110px;
                }
            }
        }
    }

    .article-reco {

        .article-item {

            .article-author {
                height: 40px;
                line-height: 40px;
                margin-bottom: 10px;

                img {
                    width: 40px;
                    height: 40px;
                    border-radius: 20px;
                    display: block;
                    float: left;
                }
                span {
                    margin-left: 10px;
                    font-weight: bold;
                }
            }
            .article-info {

                h3 {
                    height: 38px;
                    margin-top: 5px;
                    @include ellipsis-more-2;
                }
                .article-content {
                    height: 38px;
                    margin-top: 10px;
                    @include ellipsis-more-2;
                }
            }
        }
    }
</style>
