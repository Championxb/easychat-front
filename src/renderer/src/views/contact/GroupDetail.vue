<template>
    <ContentPanel>
        <div class="group-info-item">
            <div class="group-title">群封面:</div>
            <div class="group-value">
                <Avatar :userId="groupInfo.groupId"></Avatar>
            </div>
            <el-dropdown placement=bottom-end trigger="click">
                <span class="el-dropdown-link">
                    <div class="iconfont icon-more"></div>
                </span>
                <template #dropdown>
                    <el-dropdown-menu v-if="groupInfo.groupOwnerId == userInfoStore.getInfo().userId">
                        <el-dropdown-item @click="eidtGroupInfo">修改群信息</el-dropdown-item>
                        <el-dropdown-item @click="dissolutionGroup">解散该群</el-dropdown-item>
                    </el-dropdown-menu>
                    <el-dropdown-menu v-else>
                        <el-dropdown-item @click="leaveGroup">退出该群</el-dropdown-item>
                    </el-dropdown-menu>
                </template>
            </el-dropdown>
        </div>
        <div class="group-info-item">
            <div class="group-title">群ID：</div>
            <div class="group-value">{{ groupInfo.groupId }}</div>
        </div>
        <div class="group-info-item">
            <div class="group-title">群名称：</div>
            <div class=" group-value">{{ groupInfo.groupName }}</div>
        </div>
        <div class="group-info-item">
            <div class="group-title">群成员：</div>
            <div class=" group-value">{{ groupInfo.memberCount }}</div>
        </div>
        <div class="group-info-item">
            <div class="group-title">加入权限：</div>
            <div class="group-value">{{ groupInfo.joinType == 0 ? '直接加入' : "管理员同意后加入" }}</div>
        </div>
        <div class="group-info-item notice">
            <div class="group-title">公告：</div>
            <div class="group-value">{{ groupInfo.groupNotice || '-' }}</div>
        </div>
        <div class="group-info-item">
            <div class="group-title"></div>
            <div class="group-value">
                <el-button type="primary" @click="sendMessage">发送群消息 </el-button>
            </div>
        </div>
    </ContentPanel>
    <GroupEditDialog ref="groupEditDialogRef" @reloadGroupInfo="getGroupInfo" />
</template>
<script script setup>
import { ref, reactive, getCurrentInstance, nextTick, watch } from 'vue'
import { useUserInfoStore } from '@/stores/UserInfoStore'
import { useContactStateStore } from '@/stores/ContactStateStore'
import { useRoute, useRouter } from 'vue-router'
import GroupEditDialog from './GroupEditDialog.vue'
import message from '../../utils/Message'
const contactStateStore = useContactStateStore()
const userInfoStore = useUserInfoStore()
const { proxy } = getCurrentInstance()

const route = useRoute()
const router = useRouter()

const groupInfo = ref({})
const groupId = ref()
const getGroupInfo = async () => {
    let result = await proxy.Request({
        url: proxy.Api.getGroupInfo,
        params: {
            groupId: groupId.value
        }
    })
    if (!result) {
        return
    }
    groupInfo.value = result.data
}

const groupEditDialogRef = ref()
//修改群信息
const eidtGroupInfo = () => {
    groupEditDialogRef.value.show(groupInfo.value)
}

//解散群组
const dissolutionGroup = async () => {
    proxy.Confirm({
        message: '确定要解散该群吗？删除后将无法恢复',
        okfun: async () => {
            contactStateStore.setContactReload(null)
            let result = await proxy.Request({
                url: proxy.Api.dissolutionGroup,
                params: {
                    groupId: groupId.value
                }
            })
            if (!result) {
                return
            }
            proxy.Message.success('解散成功')
            //重新加载群组列表
            contactStateStore.setContactReload('DISSOLUTION_GROUP')
        }
    })
}
//退出群组
const leaveGroup = async () => {
    proxy.Confirm({
        message: '确定要退出该群吗？',
        okfun: async () => {
            contactStateStore.setContactReload(null)
            let result = await proxy.Request({
                url: proxy.Api.leaveGroup,
                params: {
                    groupId: groupId.value
                }
            })
            if (!result) {
                return
            }
            proxy.Message.success('退出成功')
            //重新加载群组列表
            contactStateStore.setContactReload('LEAVE_GROUP')
        }
    })
}

const sendMessage = () => {
    router.push({
        path: '/chat',
        query: {
            chatId: groupInfo.value.groupId, timestamp: new Date().getTime()
        }
    })
}
watch(
    () => route.query.contactId,
    (newVal, oldVal) => {
        if (newVal) {
            groupId.value = newVal
            getGroupInfo()
        }
    },
    {
        immediate: true, deep: true
    }
)
</script>
<style lang="scss" scoped>
.group-info-item {
    display: flex;
    margin: 15px 0px;
    align-items: center;

    .group-title {
        width: 100px;
        text-align: right;
    }

    .group-value {
        flex: 1;
    }
}

.notice {
    align-items: flex-start;
}
</style>
