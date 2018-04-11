<template>
    <div>
        <header>
            <i @click="routerBack()" class="iconfont icon-back pull-left"></i>
            <span class="font-bold ml-15">0</span>&nbsp;字
            <span class="color-main font-16 pull-right">发布</span>
        </header>
        <section class="con-edit">
            <div class="edit-header">
                <input type="text" placeholder="请输入标题" />
            </div>
            <textarea placeholder="请输入文章内容"></textarea>
        </section>
    </div>
</template>

<script type="text/ecmascript-6">

    export default {
        name: "Write",
        methods: {
            routerBack() {
                this.$router.back();
            }
        }
    }
</script>

<style scoped lang="scss">
    header {
        position: relative;
        width: 100%;
        height: 40px;
        padding: 10px;
        border-bottom: 1px solid rgba(0,0,0,0.1);
        background-color: #fff;
        line-height: 20px;

        .iconfont {
            font-size: 20px;
            font-weight: bold;
            margin-right: 10px;
        }
    }
    .con-edit {
        padding: 10px;

        .edit-header {
            height: 51px;
            border-bottom: 1px dashed rgba(0,0,0,0.1);

            input {
                width: 100%;
                height: 50px;
                line-height: 50px;
                font-size: 24px;
                border: none;
                outline: none;
            }
        }
        textarea {
            width: 100%;
            margin-top: 10px;
            border: none;
            outline: none;
        }
    }
</style>
