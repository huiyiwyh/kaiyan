<template>
    <div>
        <header class="normal search">
            <i @click="routerBack()" class="iconfont icon-back pull-left mr-10"></i>
            <div class="header-input">
                <input v-model="content" type="text" placeholder="搜索文章、专题、用户、文集" />
                <i @click="search()" class="iconfont icon-search pull-right"></i>
            </div>
        </header>
        <div class="body-50">
            <article class="main" id="main">
                <section class="con-subject">
                    <i class="iconfont icon-subject"></i>
                    <span>热门专题</span>
                    <i @click="goTo('searchSubject', { type: 2 })" class="iconfont icon-arrow-right pull-right"></i>
                </section>
                <section class="con-popular">
                    <div class="popular-header">
                        <i class="iconfont icon-popular"></i>
                        <span>热门搜索</span>
                        <div @click="refresh()" class="pull-right">
                            <span class="pull-right color-intro btn-refresh">换一批</span>
                            <i class="iconfont icon-refresh pull-right"></i>
                        </div>
                    </div>
                    <ul @click="searchPopular($event)" class="popular-list">
                        <li class="popular-item" v-for="item in popular" v-text="item.name"></li>
                    </ul>
                </section>
                <section class="con-history">
                    <ul @click="remove($event);searchHistory($event)" class="history-list">
                        <li class="history-item" v-for="item in history">
                            <i class="iconfont icon-clock pull-left"></i>
                            <div class="history-name" v-text="item.name"></div>
                            <i data-hid="item.id" class="iconfont icon-delete pull-right"></i>
                        </li>
                    </ul>
                    <div @click="removeAll()" class="btn-clear">清除搜索记录</div>
                </section>
            </article>
            <article class="search sr-only" id="search">
                <section class="con-user">
                    <div class="user-header">
                        <div class="font-bold pull-left">相关用户</div>
                        <i @click="goTo('searchUser', { content: content })" class="iconfont icon-arrow-right pull-right"></i>
                    </div>
                    <ul class="user-list">
                        <li @click="goTo('personIndex', { account: item.account })" class="user-item" v-for="item in result.user">
                            <img :src="config.reqUrl + item.head" class="user-head" />
                            <div class="user-info mt-5" v-text="item.nickname"></div>
                        </li>
                    </ul>
                </section>
                <section class="con-subject">
                    <div class="subject-header">
                        <div class="font-bold pull-left">相关专题</div>
                        <i @click="goTo('searchSubject', { type: '1', content: content })" class="iconfont icon-arrow-right pull-right"></i>
                    </div>
                    <ul class="subject-list">
                        <li @click="goTo('subject', { id: item.id })" class="subject-item" v-for="item in result.subject">
                            <img :src="config.reqUrl + item.thumbnail" class="subject-thumbnail" />
                            <div class="subject-name mt-5" v-text="item.name"></div>
                        </li>
                    </ul>
                </section>
                <section class="con-article">
                    <article-list-temp :article="result.article"></article-list-temp>
                </section>
            </article>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import ArticleListTemp from "@/components/common/ArticleList";
    import Article from "@/common/data/more/article";

    export default {
        name: "Search",
        components: {
            ArticleListTemp
        },
        data() {
            return {
                config: {
                    reqUrl: ""
                },
                content: "",
                popular: [],
                history: [],
                result: {
                    user: [],
                    subject: [],
                    article: {
                        type: 'recommend',
                        data: []
                    }
                }
            }
        },
        watch: {
            "content"() {
                if(this.content.length === 0) {
                    $("#main").removeClass("sr-only");
                    $("#search").addClass("sr-only");
                    this.$store.state.search.content = "";
                }
            }
        },
        created() {
            this.content = this.$store.state.search.content;
            this.config.reqUrl = this.$config.picUrl;
            const promiseForHistory = this.$request.getSearchHistory('879646529', '123456');
            promiseForHistory.then(data => {
                const _data = JSON.parse(data);
                if(Number(_data.code) === 1) {
                    this.history = _data.data;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(err => {
                console.log(err);
            });
            const promiseForPopular = this.$request.getSearchPopular('123456');
            promiseForPopular.then(data => {
                const _data = JSON.parse(data);
                if(Number(_data.code) === 1) {
                    this.popular = _data.data;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(err => {
                console.log(err);
            });
        },
        mounted() {
            this.search();
            $("#search").height($(window).height() - 50);
        },
        methods: {
            routerBack() {
                this.$router.back();
            },
            goTo(page, param) {
                this.$router.push({
                    name: page,
                    params: param
                })
            },
            search() {
                if(this.content.length !== 0) {
                    console.log("haha");
                    $("#main").addClass("sr-only");
                    $("#search").removeClass("sr-only");
                    const promise = this.$request.getSearchContent(this.content, '123456');
                    promise.then(data => {
                        const _data = JSON.parse(data);
                        if(Number(_data.code) === 1) {
                            this.result.user = _data.data.user;
                            this.result.subject = _data.data.subject;
                            this.result.article.data = _data.data.article;
                        } else {
                            console.warn(_data.msg);
                        }
                    }).catch(err => {
                        console.log(err);
                    });
                    this.$store.state.search.content = this.content;
                }
            },
            searchPopular(event) {
                if(event.target.tagName === "LI") {
                    this.content = $(event.target).text();
                    this.search();
                }
            },
            searchHistory(event) {
                const $target = $(event.target);
                if($target.hasClass('history-name')) {
                    this.content = $target.text();
                    this.search();
                }
            },
            /**
             * 换一批热门搜索
             */
            refresh() {
                const promiseForPopular = this.$request.getSearchPopular('123456');
                promiseForPopular.then(data => {
                    const _data = JSON.parse(data);
                    if(Number(_data.code) === 1) {
                        this.popular = _data.data;
                        console.log(this.popular);
                    } else {
                        console.warn(_data.msg);
                    }
                }).catch(err => {
                    console.log(err);
                });
            },
            /**
             * 清除指定搜索记录
             * @param event 事件对象
             */
            remove(event) {
                const $target = $(event.target);
                if($target.hasClass("icon-delete")) {
                    const promise = this.$request.removeSearchHistory($target.attr("data-hid"), '879646529', '123456');
                    promise.then(data => {
                        const _data = JSON.parse(data);
                        if(Number(_data.code) === 1) {
                            console.log(_data.msg);
                        } else {
                            console.warn(_data.msg);
                        }
                    }).catch(err => {
                        console.log(err);
                    })
                }
            },
            /**
             * 清除所有搜索记录
             */
            removeAll() {
                const promise = this.$request.removeAllSearchHistory('879646529', '123456');
                promise.then(data => {
                    const _data = JSON.parse(data);
                    if(Number(_data.code) === 1) {
                        console.log(_data.msg);
                    } else {
                        console.warn(_data.msg);
                    }
                }).catch(err => {
                    console.log(err);
                })
            }
        }
    }
</script>

<style scoped lang="scss">
    .body {
        background-color: #eeeeee;
    }
    .main {
        width: 100%;
        height: auto;
        padding: 0 10px;
        background-color: #fff;

        .con-subject {
            height: 40px;
            line-height: 40px;
            border-bottom: 1px solid $colorBorder;

            .icon-subject {
                font-size: 20px;
                color: $colorMain;
            }
            .icon-arrow-right {
                font-size: 14px;
                font-weight: 600;
            }
            span {
                position: relative;
                top: -3px;
                margin-left: 5px;
                font-weight: 600;
            }
        }
        .con-popular {
            height: 150px;
            border-bottom: 1px solid $colorBorder;

            .popular-header {
                height: 40px;
                line-height: 40px;

                .icon-popular {
                    font-size: 20px;
                    color: #f00;
                }
                .icon-refresh {
                    font-size: 20px;
                }
                span {
                    display: inline;
                    position: relative;
                    top: -2px;
                    margin-left: 5px;
                    font-weight: 600;
                }
                .btn-refresh {
                    top: 0;
                }
            }
            .popular-list {
                height: auto;
                padding-bottom: 10px;
                overflow: hidden;
                /*<!--margin: 0 -15px -10px 0;-->*/

                .popular-item {
                    float: left;
                    height: 24px;
                    line-height: 22px;
                    padding: 0 5px;
                    margin: 0 10px 10px 0;
                    border: 1px solid #666;
                    border-radius: 5px;
                    color: $colorFontIntro;
                }
            }
        }
        .con-history {

            .history-list {

                .history-item {
                    height: 40px;
                    line-height: 40px;
                    border-bottom: 1px solid $colorBorder;

                    i {
                        font-size: 20px;
                        font-weight: 600;
                    }
                    .history-name {
                        float: left;
                        width: 75%;
                        min-width: 270px;
                        margin-left: 10px;
                        @include ellipsis;
                    }
                }
            }
            .btn-clear {
                margin-top: 20px;
                text-align: center;
                font-size: 16px;

            }
        }
    }
    .search {
        background-color: transparent;
        overflow: auto;

        .con-user {
            width: 100%;
            height: 120px;
            border-bottom: 1px solid $colorBorder;
            background-color: #fff;

            .user-header {
                height: 40px;
                line-height: 40px;
                padding: 0 10px;
            }
            .user-list {
                height: 70px;

                .user-item {
                    width: 25%;
                    height: 70px;
                    float: left;
                    text-align: center;

                    .user-head {
                        display: inline-block;
                        width: 40px;
                        height: 40px;
                        border-radius: 20px;
                        border: 1px solid $colorBorder;
                    }
                }
            }
        }
        .con-subject {
            width: 100%;
            height: 120px;
            margin-top: 20px;
            border-bottom: 1px solid $colorBorder;
            background-color: #fff;

            .subject-header {
                height: 40px;
                line-height: 40px;
                padding: 0 10px;
            }
            .subject-list {
                height: 70px;

                .subject-item {
                    width: 25%;
                    height: 70px;
                    float: left;
                    text-align: center;

                    .subject-thumbnail {
                        display: inline-block;
                        width: 40px;
                        height: 40px;
                        border-radius: 5px;
                        border: 1px solid $colorBorder;
                    }
                }
            }
        }
        .con-article {
            margin-top: 20px;
        }
    }
</style>
