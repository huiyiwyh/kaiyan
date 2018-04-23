<template>
    <div>
        <header class="normal">
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <h3 class="font-title pull-left">我的专题</h3>
            <h3 @click="goTo('personMyNewSubject')" class="font-title pull-right btn-create">新建专题</h3>
        </header>
        <div class="body">
            <subject-list-temp :subject="subject"></subject-list-temp>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import SubjectListTemp from "../common/SubjectList"

    import subjectList from "../../common/data/person/subjectList"

    export default {
        name: "PersonMySubject",
        components: {
            SubjectListTemp
        },
        data() {
            return {
                subject: {
                    type: "my",
                    data: []
                }
            }
        },
        created() {
            const promise = this.$request.getSubjectList(3, '879646529', 0, '123456');
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
        },
        methods: {
            routerBack() {
                this.$router.back();
            },
            goTo(page, param) {
                this.$router.push({
                    name: page,
                    param: param
                })
            }
        }
    }
</script>
