<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <author-list-temp :author="author"></author-list-temp>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../common/Header"
    import AuthorListTemp from "../common/AuthorList"

    import authorList from "../../common/data/person/authorList"

    export default {
        name: "MessFocus",
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
                        title: "关注",
                        isSearch: false,
                        isSetting: false
                    }
                },
                author: {
                    type: "message",
                    data: authorList.data
                }
            }
        }
    }
</script>
