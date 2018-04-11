<template>
    <!-- 关注模块作者关注页面模板 -->
    <ul class="author-list" v-if="author.type === 'focus'">
        <li @click="goTo('personIndex')" class="author-item" v-for="item in author.data">
            <div class="author-left">
                <img :src="'http://115.159.59.72/' + item.head" alt="头像"/>
            </div>
            <div class="author-right">
                <div class="author-name pl-5" v-text="item.nickname"></div>
                <div class="author-intro" >
                    <span @click.stop="goTo('article', { aid: item.aid })" v-text="'《' + item.title + '》'"></span>
                </div>
            </div>
        </li>
    </ul>
    <!-- 关注模块推荐作者页面模板 -->
    <ul class="author-list author-reco" v-else-if="author.type === 'recommend'">
        <li class="author-item" v-for="item in author.data">
            <div @click="goTo('personIndex')" class="author-left">
                <img src="../../assets/back.jpg" alt="缩略图"/>
            </div>
            <div class="author-right">
                <div @click="goTo('personIndex')" class="author-name" v-text="item.nickname"></div>
                <div class="author-brief">人生不是戏剧，而我亦非主角</div>
                <hr>
                <ul>
                    <li @click="goTo('article')">
                        <i class="iconfont icon-article"></i>
                        <span v-text="item.article"></span>
                    </li>
                    <li @click="goTo('article')">
                        <i class="iconfont icon-article"></i>
                        <span v-text="item.article"></span>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
    <!-- 消息模块关注页面模板 -->
    <ul class="author-list" v-else-if="author.type === 'message'">
        <li @click="goTo('personIndex')" class="author-item" v-for="item in author.data">
            <div class="author-left">
                <img src="../../assets/back.jpg" alt="缩略图"/>
            </div>
            <div class="author-right">
                <div class="author-name" v-text="item.nickname + ' 关注了你'"></div>
                <div class="author-intro">2017-07-13 15:26</div>
            </div>
        </li>
    </ul>
    <!-- 我的模块我的关注页面模板 -->
    <ul class="author-list" v-else-if="author.type === 'my'">
        <li @click="goTo('personIndex')" class="author-item" v-for="item in author.data">
            <div class="author-left">
                <img :src="picUrl + item.head" alt="缩略图"/>
            </div>
            <div class="author-right">
                <div class="author-name" v-text="item.nickname"></div>
                <div class="author-intro">
                    写了<span v-text="item.countWords"></span>字&nbsp;
                    获得<span v-text="item.countLiked"></span>喜欢
                </div>
            </div>
        </li>
    </ul>
</template>

<script type="text/ecmascript-6">
    export default {
        name: "AuthorListTemp",
        props: ["author"],
        data() {
            return {
                picUrl: this.$config.picUrl
            }
        },
        methods: {
            goTo(page, param) {
                console.log(param);
                this.$router.push({
                    name: page,
                    params: param
                })
            }
        }
    }
</script>

<style scoped lang="scss">
    @import "../../common/scss/common";

    .author-list {

        .author-item {
            height: auto;
            overflow: hidden;
            padding: 10px;
            border-bottom: 1px solid $colorBorder;

            .author-left {
                width: 60px;
                float: left;

                img {
                    width: 50px;
                    height: 50px;
                    border-radius: 25px;
                }
            }
            .author-right {
                width: 75%;
                min-width: 270px;
                float: left;

                .author-name {
                    padding-top: 5px;
                    font-size: 16px;
                    font-weight: bold;
                    @include ellipsis;
                }
                .author-intro {
                    color: #666;
                    @include ellipsis;
                    font-size: 12px;
                }
            }
        }
        .author-item:first-child {
            /*<!--border-top: 1px solid $colorBorder;-->*/
        }
    }
    .author-reco {

        .author-item {

            .author-left {
                width: 50px;

                img {
                    width: 40px;
                    height: 40px;
                    border-radius: 20px;
                }
            }
            .author-right {

                .author-brief {
                    margin-top: 5px;
                    font-size: 12px;
                    color: $colorFontIntro;
                }
                hr {
                    margin: 10px 0;
                }
                li {
                    @include ellipsis;
                }
            }
        }
    }
</style>
