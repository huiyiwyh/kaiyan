<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="body">
            <subject-list-temp :subject="subject"></subject-list-temp>
        </div>
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
                    data: []
                }
            }
        },
        created() {
            const promise = this.$request.getSubjectFocus('879646529', 0, '123456');
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
</script>
