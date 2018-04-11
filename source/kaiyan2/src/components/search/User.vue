<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <author-list-temp :author="author"></author-list-temp>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "@/components/common/Header"
    import AuthorListTemp from "@/components/common/AuthorList";
    import authorView from "@/common/data/authorView"

    export default {
        name: "SearchUser",
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
                        title: "相关用户",
                        isSearch: false,
                        isSetting: false
                    }
                },
                author: {
                    type: "recommend",
                    data: authorView.data
                }
            }
        }
    }
</script>

<style scoped lang="scss">

</style>
