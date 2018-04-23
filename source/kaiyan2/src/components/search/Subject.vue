<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="body">
            <subject-list-temp :subject="subject"></subject-list-temp>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "@/components/common/Header";
    import SubjectListTemp from "@/components/common/SubjectList";

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
                    data: []
                }
            }
        },
        created() {
            const routeParam = this.$route.params;
            if(Number(this.$route.params.type) === 1) {
                this.config.header.title = routeParam.content;
                const promise = this.$request.getSearchSubject(routeParam.content, this.subject.data.length, '123456');
                promise.then(data => {
                    const _data = JSON.parse(data);
                    if(Number(_data.code) === 1) {
                        this.subject.data = _data.data;
                    } else {
                        console.warn(_data.msg);
                    }
                }).catch(err => {
                    console.log(err);
                })
            } else {
                this.config.header.title = "热门专题";
                const promise = this.$request.getSubjectList(2, this.subject.data.length, '123456');
                promise.then(data => {
                    const _data = JSON.parse(data);
                    if(Number(_data.code) === 1) {
                        this.subject.data = _data.data;
                    } else {
                        console.warn(_data.msg);
                    }
                }).catch(err => {
                    console.log(err);
                })
            }
        }
    }
</script>
