<template>
    <div>
        <header-temp :config="config.header"></header-temp>
        <div class="body">
            <vue-cropper
                ref="cropper"
                :img="popup.cropImg"
                :autoCrop="true"
                :autoCropWidth="popup.cropWidth"
                :autoCropHeight="popup.cropHeight"
                :fixedBox="true"
                :outputSize="1"
                :outputType="'jpg'"
                style="height: 300px;"
            ></vue-cropper>
        </div>
    </div>
</template>

<script type="text/ecmascript-6">
    import HeaderTemp from "../../components/common/Header"
    import VueCropper from "vue-cropper"

    export default {
        name: "MyHead",
        data() {
            return {
                config: {
                    header: {
                        style: "normal",
                        isBack: true,
                        title: "更换头像",
                        isSearch: false,
                        isSetting: false
                    },
                    picUrl: ""
                },
                popup: {
                    cropWidth: 200,
                    cropHeight: 200,
                    cropImg: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1623634399,4054906576&fm=27&gp=0.jpg'
                }
            }
        },
        components: {
            HeaderTemp,
            VueCropper
        }
    }
</script>

<style scoped lang="scss">

</style>
