<template>
    <ContentPanel>
        <el-form label-position="top" ref="formDataRef" label-width="80px" @submit.prevent>
            <el-form-item label="版本信息" class="version-info">
                <div>EasyChat {{ config.version }}</div>
                <div>
                    <el-button type="primary" @click="checkUpdate">检查更新</el-button>
                </div>
            </el-form-item>
        </el-form>
    </ContentPanel>
</template>
<script setup>
import config from '../../../../../package.json'
import { ref, getCurrentInstance, nextTick, computed } from 'vue'
const { proxy } = getCurrentInstance()
import { useRoute, useRouter } from "vue-router"
import { useUserInfoStore } from '@/stores/UserInfoStore'
const userInfoStore = useUserInfoStore()
const route = useRoute()
const router = useRouter()

//TODO 检查更新
const checkUpdate = () => {
}
</script>
<style lang="scss" scoped></style>