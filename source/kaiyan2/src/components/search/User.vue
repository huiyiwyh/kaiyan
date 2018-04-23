<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="body">
            <author-list-temp :author="author"></author-list-temp>
        </div>
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
                    data: []
                }
            }
        },
        created() {
            const routeParam = this.$route.params;
            this.config.header.title = routeParam.content;
            const promise = this.$request.getSearchUser(routeParam.content, this.author.data.length, '123456');
            promise.then(data => {
                const _data = JSON.parse(data);
                if(Number(_data.code) === 1) {
                    this.author.data = _data.data;
                } else {
                    console.warn(_data.msg);
                }
            }).catch(err => {
                console.log(err);
            })
        }
    }
</script>

<style scoped lang="scss">

</style>
