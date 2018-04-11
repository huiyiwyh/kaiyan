<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <article-temp :article="article"></article-temp>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../../components/common/Header"
    import ArticleTemp from "../common/ArticleList"

    import article from "../../common/data/person/article"

    export default {
        name: "PersonMyArticle",
        components: {
            HeaderTemp,
            ArticleTemp
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
