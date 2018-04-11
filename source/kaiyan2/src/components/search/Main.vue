<template>
    <div class="body">
        <header class="normal">
            <i @click="routerBack()" class="iconfont icon-back pull-left mr-10"></i>
            <div class="header-input">
                <input v-model="content" type="text" placeholder="搜索文章、专题、用户、文集" />
                <i @click="search()" class="iconfont icon-search pull-right"></i>
            </div>
        </header>
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
                    <span class="pull-right color-intro btn-refresh">换一批</span>
                    <i class="iconfont icon-refresh pull-right"></i>
                </div>
                <ul class="popular-list">
                    <li class="popular-item" v-for="item in popular" v-text="item"></li>
                </ul>
            </section>
            <section class="con-history">
                <ul class="history-list">
                    <li class="history-item">
                        <i class="iconfont icon-clock pull-left"></i>
                        <div class="history-name">区块链</div>
                        <i class="iconfont icon-delete pull-right"></i>
                    </li>
                    <li class="history-item">
                        <i class="iconfont icon-clock pull-left"></i>
                        <div class="history-name">区块链</div>
                        <i class="iconfont icon-delete pull-right"></i>
                    </li>
                </ul>
                <div class="btn-clear">清除搜索记录</div>
            </section>
        </article>
        <article class="search sr-only" id="search">
            <section class="con-user">
                <div class="user-header">
                    <div class="font-bold pull-left">相关用户</div>
                    <i @click="goTo('searchUser')" class="iconfont icon-arrow-right pull-right"></i>
                </div>
                <ul class="user-list">
                    <li class="user-item">
                        <div class="user-head"></div>
                        <div class="user-info mt-5">区块链</div>
                    </li>
                    <li class="user-item">
                        <div class="user-head"></div>
                        <div class="user-info mt-5">区块链</div>
                    </li>
                    <li class="user-item">
                        <div class="user-head"></div>
                        <div class="user-info mt-5">区块链</div>
                    </li>
                    <li class="user-item">
                        <div class="user-head"></div>
                        <div class="user-info mt-5">区块链</div>
                    </li>
                </ul>
            </section>
            <section class="con-subject">
                <div class="subject-header">
                    <div class="font-bold pull-left">相关专题</div>
                    <i @click="goTo('searchSubject', { type: '1' })" class="iconfont icon-arrow-right pull-right"></i>
                </div>
                <ul class="subject-list">
                    <li class="subject-item">
                        <div class="subject-thumbnail"></div>
                        <div class="subject-name mt-5">区块链</div>
                    </li>
                    <li class="subject-item">
                        <div class="subject-thumbnail"></div>
                        <div class="subject-name mt-5">区块链</div>
                    </li>
                    <li class="subject-item">
                        <div class="subject-thumbnail"></div>
                        <div class="subject-name mt-5">区块链</div>
                    </li>
                    <li class="subject-item">
                        <div class="subject-thumbnail"></div>
                        <div class="subject-name mt-5">区块链</div>
                    </li>
                </ul>
            </section>
            <section class="con-article">
                <article-list-temp :article="article"></article-list-temp>
            </section>
        </article>
    </div>
</template>

<script type="text/ecmascript-6">
    import ArticleListTemp from "@/components/common/ArticleList";
    import Article from "@/common/data/more/article";
    const searchTestData = [
        'axure', 'sketch', 'photoshop', '高保真', '付费连载', '原型设计', '区块链',
        '吃瓜群众岱岱', '考研', '蒋坤元', '简书交友', '反恐', '缉私', '国旗', '救灾',
        '惩治', '高危', '国歌', '案发', '小程序', '防腐', 'vue', '故事', '白云麦田'
    ];

    export default {
        name: "Search",
        components: {
            ArticleListTemp
        },
        data() {
            return {
                content: "",
                popular: [],
                article: {
                    type: 'recommend',
                    data: Article.data
                }
            }
        },
        watch: {
            "content"() {
                if(this.content.length === 0) {
                    $("#main").removeClass("sr-only");
                    $("#search").addClass("sr-only");
                }
            }
        },
        created() {
            this.popular = searchTestData.slice(0, 11);
        },
        mounted() {


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
                    $("#main").addClass("sr-only");
                    $("#search").removeClass("sr-only");
                }
            }
        }
    }
</script>

<style scoped lang="scss">
    .body {
        background-color: #eeeeee;
    }
    header {
        width: 100%;
        height: 50px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;
        line-height: 30px;

        .header-input {
            width: 85%;
            min-width: 300px;
            height: 30px;
            line-height: 30px;
            padding: 0 10px 0 20px;
            border: 1px solid $colorBorder;
            border-radius: 15px;
            float: left;

            input {
                width: 85%;
                min-width: 240px;
                height: 24px;
                padding: 0;
                border: none;
                outline: none;
            }
        }
        .iconfont {
            font-size: 20px;
            font-weight: bold;
        }
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
