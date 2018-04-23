<template>
    <div>
        <header class="normal">
            <h3 class="font-title pull-left">关注</h3>
            <i @click="goTo('searchMain')" class="iconfont icon-search pull-right"></i>
            <i @click="goTo('focusRecommend')" class="iconfont icon-focus pull-right"></i>
        </header>
        <div class="body">
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
            <section class="loading" id="loading">
                <i class="iconfont icon-refresh"></i>
            </section>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import "swiper/dist/css/swiper.min.css"
    import Swiper from "swiper/dist/js/swiper.min"
    import AuthorListTemp from "@/components/common/AuthorList"
    import SubjectListTemp from "@/components/common/SubjectList"

    let mySwiper;
    export default {
        name: "FocusMain",
        components: {
            AuthorListTemp,
            SubjectListTemp
        },
        data() {
            return {
                config: {
                    reqUrl: {}
                },
                author: {
                    type: 'focus',
                    data: []
                },
                subject: {
                    type: "focus",
                    data: []
                }
            }
        },
        created() {
            const promiseForAuthor = this.$request.getAuthorList('879646529', '1', 10, '123456');
            promiseForAuthor.then(data => {
                const _data = JSON.parse(data);
                if (Number(_data.code) === 1) {
                    this.author.data = _data.data;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(error => {
                console.log(error);
            });
        },
        mounted() {
            const _this = this;
            mySwiper = new Swiper('.swiper-container', {
                direction: 'horizontal',
                on: {
                    slideChange: function () {
                        let $conBody = $("#conBody");
                        let tabItem = $(".tab-item").siblings().removeClass("active")
                            .get(mySwiper.activeIndex);
                        tabItem.classList.add("active");
                        console.log(mySwiper.activeIndex);
                        if (mySwiper.activeIndex === 1 && _this.subject.data.length === 0) {
                            const promiseForSubject = _this.$request.getSubjectFocus('879646529', 10, '123456');
                            promiseForSubject.then(data => {
                                const _data = JSON.parse(data);
                                if (Number(_data.code) === 1) {
                                    _this.subject.data = _data.data;
                                } else {
                                    console.warn(_data.msg);
                                }
                            }).catch(err => {
                                console.log(err);
                            })
                        }
                    }
                }
            });
            let flag = false,
                lastY = 0,
                lastX = 0;
            const $swiperCon = $(".swiper-container"),
                $loading = $("#loading");
            $swiperCon.on("touchstart", (event) => {
                console.log("开始滑动");
                flag = true;
                lastY = event.changedTouches[0].screenY;
                lastX = event.changedTouches[0].screenX;
            });
            $swiperCon.on("touchmove", function (event) {
                if (flag) {
                    const diff = event.changedTouches[0].screenY - lastY,
                        diffX = Math.abs(event.changedTouches[0].screenX - lastX),
                        offset = 40;
                    if (diffX < diff) {
                        if (diff > offset && diff <= 240) {
                            $loading.css({
                                "top": (diff - offset) + "px",
                                "transform": "rotate(-" + parseInt((diff - offset) / 200 * 360) + "deg)",
                                "opacity": (diff - offset) / 100
                            });
                        }
                    }
                }
            });
            $swiperCon.on("touchend", (event) => {
                console.log("滑动结束");
                flag = false;
                console.log(Number($loading.css("opacity")));
                if (Number($loading.css("opacity")) === 1) {
                    const promise = Request.getAuthorList('879646529', '1', 10, '123456');
                    promise.then(data => {
                        const _data = JSON.parse(data);
                        if (Number(_data.code) === 1) {
                            this.author.data = _data.data;
                        } else {
                            console.warn(_data.msg);
                        }
                    }).catch(error => {
                        console.log(error);
                    })
                }
                $loading.css({
                    "top": "-5px",
                    "transform": "rotate(0)",
                    "opacity": "0"
                });
            });
            $(".tab-list").on("click", function (e) {
                let target = $(e.target);
                target.addClass("active")
                    .siblings().removeClass("active");
                mySwiper.slideTo(target.data("slideTo"), 500, false);
            });
            $("#conBody").height($(window).height() - 130);
        },
        methods: {
            goTo(page, param) {
                this.$router.push({
                    name: page,
                    param: param
                })
            },
            repaint() {

            }
        }
    }
</script>

<style scoped lang="scss">
    .con-tab {
        position: relative;
        height: 40px;
        padding: 5px 10px;
        border-bottom: 1px solid $colorBorder;
        z-index: 100;
        background-color: #fff;

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

    .loading {
        position: absolute;
        top: -5px;
        left: 50%;
        width: 40px;
        height: 40px;
        line-height: 40px;
        margin-left: -20px;
        text-align: center;
        border-radius: 20px;
        box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.3);
        opacity: 0;

        i {
            font-size: 20px;
            font-weight: bold;
            color: $colorMain;
        }
    }
</style>
