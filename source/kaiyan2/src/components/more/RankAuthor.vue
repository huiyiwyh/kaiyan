<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <section class="con-author">
            <author-list-temp :author="author"></author-list-temp>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "@/components/common/Header"
    import AuthorListTemp from "@/components/common/AuthorList"

    import authorRank from "../../common/data/more/rankAuthor"

    export default {
        name: "RankAuthor",
        components: {
            HeaderTemp,
            AuthorListTemp
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "作者榜",
                        isSetting: false,
                        isSearch: false
                    }
                },
                author: {
                    type: 'focus',
                    data: authorRank.data
                }
            }
        },
        mounted() {
            this.$nextTick(function() {

            })
        }
    }
</script>

<style scoped lang="scss">
    @import "../../common/scss/common";
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
