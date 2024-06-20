<template>
    <div>
        <AvatarBase :userId='userId' :width="width" :borderRadius="borderRadius" :showDetail="false"
            v-if="userId == 'Urobot'" />
        <el-popover v-else :width="280" placement="right-start" :show-arrow="false" trigger="click" transition="none"
            :hide-after="0" @show="getContactInfo" ref="popoverRef">
            <template #reference>
                <AvatarBase :userId='userId' :width="width" :borderRadius="borderRadius" :showDetail="false" />
            </template>
            <templadivte #default>
                <div class="popover-user-panel">
                    <UserBaseInfo :userInfo='userInfo' />
                    <div class="op-btn" v-if="userId !== userInfoStore.getInfo().userId">
                        <el-button v-if="userInfo.contactStatus == 1" type="primary" @click="sendMessage">
                            发送消息
                        </el-button>
                        <el-button v-else type="primary" @click="addContact">
                            加为好友
                        </el-button>
                    </div>
                </div>
            </templadivte>
        </el-popover>
    </div>
</template>
<script setup>
import AvatarBase from './AvatarBase.vue'
import UserBaseInfo from './UserBaseInfo.vue'
import { ref, reactive, getCurrentInstance, nextTick } from 'vue'
import { useUserInfoStore } from '@/stores/UserInfoStore'

const { proxy } = getCurrentInstance()
const userInfoStore = useUserInfoStore()

const props = defineProps({
    userId: {
        type: String
    },
    width: {
        type: Number,
        default: 40

    },
    borderRadius: {
        type: Number,
        default: 0,
    },
    groupId: {
        type: String
    }
})
const userInfo = ref({})
const getContactInfo = async () => {
    userInfo.value.userId = props.userId

    if (userInfoStore.getInfo().userId == props.userId) {
        return userInfo.value = userInfoStore.getInfo()
    } else {
        let result = await proxy.Request({
            url: proxy.Api.getContactInfo,
            params: {
                contactId: props.userId
            },
            showLoading: false
        })
        if (!result) {
            return
        }
        userInfo.value = Object.assign({}, result.data)
    }
}
//发送消息
const sendMessage = () => {

}
//添加好友
const addContact = () => {

}
</script>
<style lang="scss" scoped>
.op-btn {
    text-align: center;
    border-top: 1px solid #eaeaea;
    padding-top: 20px;
}
</style>