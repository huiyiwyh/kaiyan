<template>
    <div>
        <header class="normal">
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <h3 class="font-title pull-left">新建专题</h3>
            <h3 class="font-title pull-right btn-submit">提交</h3>
        </header>
        <section>
            <div class="subject-pic">
                <img src="../../assets/back.jpg" />
                <div class="subject-intro">为您的专题选择一张封面吧</div>
            </div>
            <form class="form">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="给专题命名（不超过12个字）" />
                </div>
                <div class="form-group">
                    <textarea class="form-control" placeholder="给专题添加适当的描述"></textarea>
                </div>
            </form>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">

    export default {
        name: "PersonMyNewSubject",
        methods: {
            routerBack() {
                this.$router.back();
            },
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
        .btn-submit {
            color: #0099cc;
            font-weight: 400;
        }
    }
    section {
        padding-top: 50px;

        .subject-pic {
            height: 150px;
            text-align: center;

            img {
                width: 80px;
                height: 80px;
                border-radius: 10px;
            }
            .subject-intro {
                margin-top: 15px;
                color: #666;
            }
        }

        .form-group {
            margin-bottom: 0;
            padding: 10px 15px;
            border-top: 1px solid rgba(0,0,0,0.1);
        }
        textarea {
            resize: none;
            height: 300px;
        }
    }
</style>
