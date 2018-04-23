<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="body">
            <article-temp :article="article"></article-temp>
        </div>
        <!--<test></test>-->
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../../components/common/Header"
    import ArticleTemp from "../common/ArticleList"
    import Test from "../common/Test"

    import article from "../../common/data/person/article"

    export default {
        name: "PersonMyArticle",
        components: {
            HeaderTemp,
            ArticleTemp,
            Test
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "我的文章",
                        isSearch: false,
                        isSetting: false
                    }
                },
                article: {
                    type: 'my',
                    data: article.data
                }
            }
        }
    }
</script>
