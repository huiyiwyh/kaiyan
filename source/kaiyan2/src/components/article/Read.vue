<template>
    <div>
        <header class="normal">
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <i class="iconfont icon-list pull-right"></i>
            <ul class="con-option sr-only">
                <li class="option-item">
                    <i class="iconfont icon-setting"></i>
                    <span>显示模式</span>
                </li>
                <li class="option-item">
                    <i class="iconfont icon-alert"></i>
                    <span>举报用户</span>
                </li>
            </ul>
        </header>
        <div class="body">
            <section class="con-header">
                <h3 v-text="article.title"></h3>
                <div class="header-author">
                    <img :src="'http://115.159.59.72/' + article.head" alt="head" />
                    <span class="ml-10 font-16 font-bold" v-text="article.nickname"></span>
                </div>
                <div class="header-date">
                    <span v-text="article.date"></span>
                    <div @click="goTo('subject', { id: article.sid })" class="btn btn-default pull-right mt-5" v-text="article.subjectName"></div>
                </div>
            </section>
            <section class="con-read" v-html="article.content"></section>
            <section class="con-comment">
                <div class="comment-header">
                    <div class="header-article">
                        评论数&nbsp;
                        <span v-text="article.countComment"></span>
                    </div>
                    <!--<div class="dropdown" id="menu">-->
                        <!--<button class="btn btn-default dropdown-toggle">-->
                            <!--<span v-text="choice.title"></span>-->
                            <!--<span class="caret"></span>-->
                        <!--</button>-->
                        <!--<ul class="dropdown-menu">-->
                            <!--<li @click="choose(0)"><a href="javascript:;">按时间正序</a></li>-->
                            <!--<li role="separator" class="divider"></li>-->
                            <!--<li @click="choose(1)"><a href="javascript:;">按时间倒序</a></li>-->
                        <!--</ul>-->
                    <!--</div>-->
                </div>
                <ul class="comment-list">
                    <li class="comment-item" v-for="item in comment">
                        <div class="comment-author">
                            <img :src="'http://115.159.59.72/' + item.head" alt="head" />
                            <span class="ml-5 font-16 font-bold" v-text="item.nickname"></span>
                            <i class="iconfont icon-comment pull-right ml-10"></i>
                            <span class="color-intro pull-right font-12" v-text="item.date"></span>
                        </div>
                        <div class="comment-content" v-text="item.content"></div>
                        <ul class="comment-reply">
                            <li class="reply-item" v-for="subItem in item.subComment">
                                <span class="color-main" v-text="subItem.nickname + '：@'"></span>
                                <span class="color-main" v-text="item.nickname"></span>&nbsp;
                                <span v-text="subItem.content"></span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </section>
            <section class="con-oper">
                <div class="oper-item">
                    <i class="iconfont icon-comment"></i>
                    <div>评论&nbsp;<span v-text="article.countComment"></span></div>
                </div>
                <div class="oper-item">
                    <i class="iconfont icon-unlike"></i>
                    <div>喜欢&nbsp;<span v-text="article.countLike"></span></div>
                </div>
                <div class="oper-item">
                    <i class="iconfont icon-book"></i>
                    <div>阅读&nbsp;<span v-text="article.countRead"></span></div>
                </div>
            </section>
            <section class="con-reply sr-only">
                <textarea placeholder="@耗子爱骑车"></textarea>
                <div class="btn btn-default pull-right mt-10">发表评论</div>
            </section>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">

    export default {
        name: "Read",
        data() {
            return {
                choice: {
                    title: '按时间正序',
                    option: 0
                },
                article: {},
                comment: []
            }
        },
        mounted() {
            $("#menu").on("click", function (e) {
                let target = e.target;
                if (target.tagName === "SPAN" || target.tagName === "BUTTON") {
                    $(this).find(".dropdown-menu").slideDown(500);
                } else if (target.tagName === "A") {
                    $(this).find(".dropdown-menu").slideUp(500);
                }
            });
            console.log(this.$route.params.aid);
        },
        created() {
            const promise = this.$request.getArticleDetail('879646528180323135935', '879646529', '123456');
            promise.then(data => {
                const _data = JSON.parse(data);
                if(Number(_data.code) === 1) {
                    this.article = _data.data;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(err => {
                console.log(err);
            }).then(() => {
                const $imgs = $(".con-article").find("img");
                $imgs.each((index, item) => {
                    item.setAttribute("src", "https:" + item.getAttribute("data-original-src"));
                })
            });
            const promiseForComment = this.$request.getArticleComment('879646528180323135935', 10, '123456');
            promiseForComment.then(data => {
                const _resp = JSON.parse(data);
                if(Number(_resp.code) === 1) {
                    this.comment = _resp.data;
                } else {
                    console.warn(_resp.msg);
                }
            }).catch(err => {
                console.log(err);
            })
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
            choose(option) {
                if (Number(option) === 0) {
                    this.choice.title = "最新文章";
                } else {
                    this.choice.title = "热门文章";
                }
                this.choice.option = option;
            }
        }
    }
</script>

<style lang="scss">
    .con-header {
        height: 130px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);

        h3 {
            margin: 0;
            font-size: 18px;
            font-weight: bold;
        }
        .header-author,
        .header-date {
            margin-top: 5px;
            height: 40px;
            line-height: 40px;

            img {
                width: 40px;
                height: 40px;
                border-radius: 20px;
            }
        }
    }
    .con-read {
        height: auto;
        padding: 20px;
        overflow: auto;

        p {
            text-indent: 2em;
        }
        .image-package {
            padding-bottom: 25px;
            /*width: 320;*/
            text-align: center;

            .image-container {
                background-color: transparent;
                z-index: 100;
                position: relative;
                transition: background-color 0.1s linear;
                margin: 0 auto;
            }
            .image-container-fill {
                z-index: 50;
            }
            .image-view {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;

                img {
                    display: block;
                    transition: all .15s linear;
                    z-index: 100;
                    -webkit-filter: blur(0);
                    filter: blur(0);
                    opacity: 1;
                    max-width: 100%;
                    height: auto;
                    vertical-align: middle;
                    border: 0;
                    cursor: -webkit-zoom-in;
                }
            }
        }
    }
    .con-comment {
        padding-bottom: 60px;
        border-top: 1px solid rgba(0,0,0,0.1);
        border-bottom: 1px solid rgba(0,0,0,0.1);

        .comment-header {
            height: 40px;
            padding: 0 10px;
            border-bottom: 1px solid rgba(0,0,0,0.1);

            .header-article {
                height: 100%;
                line-height: 40px;
                color: #0099cc;
                float: left;
            }
            .dropdown {
                width: 100px;
                margin-top: 5px;
                float: right;

                .dropdown-toggle {
                    width: 100px;
                }
                .dropdown-menu {
                    width: 100px;
                    min-width: 100px;

                    a {
                        height: 30px;
                        line-height: 30px;
                        padding: 0;
                        text-align: center;
                    }
                    .divider {
                        height: 1px;
                        line-height: 1px;
                        margin: 0;
                    }
                }
            }
        }
        .comment-list {
            padding: 10px;
            margin-bottom: -1px;

            .comment-item {
                padding-top: 10px;
                border-bottom: 1px solid rgba(0,0,0,0.1);

                .comment-author {
                    height: 40px;
                    line-height: 40px;

                    img {
                        width: 40px;
                        height: 40px;
                        border-radius: 20px;
                    }
                    i {
                        font-size: 24px;
                    }
                }
                .comment-content {
                    margin-top: 10px;
                    padding-bottom: 10px;
                    border-bottom: 1px dashed rgba(0,0,0,0.1);
                }
                .comment-reply {
                    margin: 10px 0;

                    .reply-item {
                        margin-bottom: 10px;
                    }
                }
            }
        }
    }
    .con-oper {
        display: flex;
        position: fixed;
        bottom: 0;
        z-index: 1000;
        width: 100%;
        height: 50px;
        border-top: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;

        .oper-item {
            width: 33%;
            height: 100%;
            text-align: center;
            flex-direction: row;
            /*line-height: 50px;*/

            i {
                font-size: 1.5em;
            }
            div {
                font-size: 0.7em;
                color: #666;
            }
        }
    }
    .con-reply {
        position: fixed;
        bottom: 50px;
        width: 100%;
        height: 200px;
        padding: 20px;
        border-top: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;

        textarea {
            width: 100%;
            height: 120px;
            background-color: #ddd;
            padding: 10px 20px;
        }
    }
</style>
