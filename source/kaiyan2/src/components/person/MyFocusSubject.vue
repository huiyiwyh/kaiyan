<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <subject-list-temp :subject="subject"></subject-list-temp>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../../components/common/Header"
    import SubjectListTemp from "../common/SubjectList"

    import subjectList from "../../common/data/person/subjectList"

    export default {
        name: "PersonMySubject",
        components: {
            HeaderTemp,
            SubjectListTemp
        },
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "关注的专题",
                        isSearch: false,
                        isSetting: false
                    }
                },
                subject: {
                    type: 'focus',
                    data: subjectList.data
                }
            }
        }
    }
</script>
