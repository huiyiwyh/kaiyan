<template>
    <div>
        <header class="normal">
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <h3 class="font-title pull-left">我的专题</h3>
            <h3 @click="goTo('personMyNewSubject')" class="font-title pull-right btn-create">新建专题</h3>
        </header>
        <subject-list-temp :subject="subject"></subject-list-temp>
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
                    data: subjectList.data
                }
            }
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

<style scoped lang="scss">
    .normal {
        width: 100%;
        height: 40px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;
        line-height: 20px;

        h3 {
            margin: 0;
            font-size: 20px;
            font-weight: bold;
        }
        .iconfont {
            font-size: 20px;
            font-weight: bold;
            margin-right: 10px;
        }
        .btn-create {
            font-weight: 400;
            color: #0099cc;
        }
    }
</style>
