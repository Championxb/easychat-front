<template>
    <diV class="avatar-upload">
        <div class="avatar-show">
            <template v-if="modelValue">
                <el-image v-if="preview" :src="localFile" fit="scale-down"></el-image>
                <ShowLocalImage :fileId="props.modelValue" partType="avatar" :width="40" v-else />
            </template>
            <template v-else>
                <el-upload name="file" :show-file-list="false"
                    accept=".png,.PNG,.jpg,.JPG,.jpeg,.JPEG,.gif,.GIF,.bmp,.BMP" :multiple="false"
                    :http-request="uploadImage">
                    <span class="iconfont icon-add"></span>
                </el-upload>
            </template>
        </div>
        <div class="select-btn">
            <el-upload name="file" :show-file-list="false"
                aqcept=".png,.PNG,.jpg,.JPG,.jpeg,.JPEG, .gif,.GIF, .bmp, .BMP" :multiple="false"
                :http-request="uploadImage">
                <el-button type="primary" size="small">选择</el-button>
            </el-upload>
        </div>
    </diV>
</template>
<script setup>
import { ref, reactive, getCurrentInstance, nextTick, computed } from 'vue'
const { proxy } = getCurrentInstance()
const props = defineProps({
    modelValue: {
        type: { Object, String },
        default: null
    }
})
const preview = computed(() => {
    return props.modelValue instanceof File
})
//TODO文件上传
const uploadImage = () => {
}
</script>
<style lang="scss" scoped>
.avatar-upload {
    display: flex;
    justify-content: center;
    align-items: end;
    line-height: normal;

    .avatar-show {
        background: #ededed;
        width: 60px;
        height: 60px;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        position: relative;

        .icon-add {
            font-size: 30px;
            color: #b9b9b9;
            width: 60px;
            height: 60px;
            text-align: center;
            line-height: 60px;
        }

        img {
            width: 100%;
            height: 100%;
        }

        .op {
            position: absolute;
            color: #0e8aef;
            top: 80px;
        }


    }

    .select-btn {
        vertical-align: bottom;
        margin-left: 5px;
    }
}
</style>
