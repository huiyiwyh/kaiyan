<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <subject-list-temp :subject="subject"></subject-list-temp>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "@/components/common/Header";
    import SubjectListTemp from "@/components/common/SubjectList";
    import Subject from "@/common/data/focus/subjectList"

    export default {
        name: "SearchSubject",
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
                        title: "相关专题",
                        isSearch: false,
                        isSetting: false
                    }
                },
                subject: {
                    type: "focus",
                    data: Subject.data
                }
            }
        },
        created() {
            if(Number(this.$route.params.type) === 1) {

            } else {
                this.config.header.title = "热门专题"
            }
        }
    }
</script>
