<template>
    <!-- 关注模块专题列表模板 -->
    <ul class="subject-list subject-reco" v-if="subject.type === 'focus'">
        <li @click="goTo('subject', { id: item.id })" class="subject-item" v-for="item in subject.data">
            <div class="subject-left">
                <img :src="picUrl + item.thumbnail" alt="缩略图"/>
            </div>
            <div class="subject-right">
                <div class="subject-title" v-text="item.name"></div>
                <div class="subject-data">
                    <span v-text="item.countArticle"></span>&nbsp;篇文章&nbsp;
                    <span v-text="item.countFocus"></span>&nbsp;人关注
                </div>
                <div class="subject-intro" v-text="item.brief"></div>
            </div>
        </li>
    </ul>
    <!-- 我的模块专题模板 -->
    <ul class="subject-list subject-other" v-else-if="subject.type === 'my'">
        <li @click="goTo('subject')" class="subject-item" v-for="item in subject.data">
            <div class="subject-left">
                <img :src="picUrl + item.thumbnail" alt="缩略图"/>
            </div>
            <div class="subject-right">
                <div class="subject-title" v-text="item.name"></div>
                <div class="subject-data">
                    <span v-text="item.nickname"></span>&nbsp;
                    <span v-text="item.countArticle"></span>篇文章&nbsp;&nbsp;
                    <span v-text="item.countFocus"></span>人关注
                </div>
            </div>
        </li>
    </ul>
</template>

<script type="text/ecmascript-6">
    export default {
        name: "SubjectListTemp",
        props: ["subject"],
        data() {
            return {
                picUrl: this.$config.picUrl
            }
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
    .subject-list {

        .subject-item {
            height: auto;
            overflow: hidden;
            padding: 10px;
            border-bottom: 1px solid $colorBorder;

            .subject-left {
                width: 60px;
                float: left;

                img {
                    width: 50px;
                    height: 50px;
                    border-radius: 5px;
                }
            }
            .subject-right {
                width: 75%;
                min-width: 280px;
                float: left;

                .subject-title {
                    padding-top: 5px;
                    font-size: 16px;
                    font-weight: bold;
                    @include ellipsis;
                }
                .subject-data {
                    color: #666;
                    @include ellipsis;
                }
            }
        }
    }

    .subject-reco {

        .subject-item {

            .subject-left {

                img {
                    width: 40px;
                    height: 40px;
                }
            }
            .subject-right {

                .subject-data {
                    margin-top: 5px;
                    font-size: 12px;
                }
                .subject-intro {
                    margin-top: 5px;
                    @include ellipsis-more-3;
                }
            }
        }
    }
</style>
