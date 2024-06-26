<template>
    <Layout>
        <template #left-content>
            <div class="drag-panel drag"></div>
            <div class="top-search">
                <el-input clearable placeholder="搜索" v-moldel="searchKey" size="small" @keyup="search">
                    <template #suffix>
                        <span class="iconfont icon-search"></span>
                    </template>
                </el-input>
            </div>
            <div class="contact-list">
                <tempplate v-for="part in partList">
                    <div class="part-title">{{ part.partName }}</div>
                    <div class="part-list">
                        <div v-for="sub in part.children" :class="['part-item', sub.path == route.path ? 'active' : '']"
                            @click="partJump(sub)">
                            <div :class="['iconfont', sub.icon]" :style="{ background: sub.iconBgColor }"> </div>
                            <div class="text">{{ sub.name }}</div>
                        </div>
                        <template v-for="contact in part.contactData">
                            <div :class="['part-item', contact[part.contactId] == route.query.contactId ? 'active' : '']"
                                @click="contactDetail(contact, part)">
                                <Avatar :userId="contact[part.contactId]" :width="35"></Avatar>
                                <div class="text">
                                    {{ contact[part.contactName] }}
                                </div>
                            </div>
                        </template>
                        <template v-if="part.contactData && part.contactData.length == 0">
                            <div class="no-data">
                                {{ part.emptyMsg }}
                            </div>
                        </template>
                    </div>
                </tempplate>
            </div>
        </template>
        <template #right-content>
            <div class="title-panel drag">{{ rightTitle }}</div>
            <router-view v-slot="{ Component }">
                <component :is="Component" ref="componentRef"></component>
            </router-view>
        </template>
    </Layout>
</template>

<script setup>
import { ref, reactive, getCurrentInstance, nextTick, onMounted, watch } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useContactStateStore } from '@/stores/ContactStateStore'
const contactStateStore = useContactStateStore()
const { proxy } = getCurrentInstance()
const router = useRouter()
const route = useRoute()

const searchKey = ref()
const search = () => {
}
const rightTitle = ref('聊天窗口')
const partList = ref([
    {
        partName: "新朋友",
        children: [
            {
                name: "搜好友",
                icon: 'icon-search',
                iconBgColor: '#fa9d3b',
                path: '/contact/search',
            },
            {
                name: '新的朋友',
                icon: 'icon-plane',
                iconBgColor: '#08bf61',
                path: '/contact/contactNotice',
                showTitle: true,
                countKey: "contactApplyCount"
            }
        ]
    },
    {
        partName: '我的群聊',
        children: [
            {
                name: '新建群聊',
                icon: 'icon-add-group',
                iconBgColor: "#1485ee",
                path: '/contact/createGroup',
            }
        ],
        contactId: 'groupId',
        contactName: "groupName",
        showTitle: true,
        contactData: [],
        contactPath: '/contact/groupDetail',
    },
    {
        partName: '我加入的群聊',
        contactId: 'contactId',
        contactName: "contactName",
        showTitle: true,
        contactData: [],
        contactPath: '/contact/groupDetail',
        emptyMsg: '暂未加入群聊'
    },
    {
        partName: "我的好友",
        children: [],
        contactId: 'contactId',
        contactName: 'contactName',
        contactData: [],
        contactPath: '/contact/userDetail',
        emptyMsg: '暂无好友'
    }
])
const partJump = (data) => {
    if (data.showTitle) {
        rightTitle.value = data.name
    } else {
        rightTitle.value = null
    }
    //TODO处理联系人申请已读
    router.push(data.path)
}
const loadContact = async (contactType) => {
    let result = await proxy.Request({
        url: proxy.Api.loadContact,
        params: {
            contactType
        }
    })
    if (!result) {
        return
    }
    if (contactType == 'GROUP') {
        for (let i = 0; i < result.data.length; i++) {
            if (result.data[i].status == 1) {
                partList.value[2].contactData.push(result.data[i])
            }
        }
        // partList.value[2].contactData = result.data
    } else if (contactType == 'USER') {
        partList.value[3].contactData = result.data
    }
}

const loadMyGroup = async () => {
    let result = await proxy.Request({
        url: proxy.Api.loadMyGroup,
        showLoading: false
    })
    if (!result) {
        return
    }
    partList.value[1].contactData = []
    for (let i = 0; i < result.data.length; i++) {
        if (result.data[i].status == 1) {
            partList.value[1].contactData.push(result.data[i])
        }
    }
    // partList.value[1].contactData = result.data
}
onMounted(() => {
    loadContact('GROUP')
    loadContact('USER')

    loadMyGroup()
})
const contactDetail = (contact, part) => {
    console.log(part)
    console.log(contact)
    if (part.showTitle) {
        rightTitle.value = contact[part.contactName]
    } else {
        rightTitle.value = null
    }
    //群存在
    if (contact.status) {
        router.push({
            path: part.contactPath,
            query: {
                contactId: contact[part.contactId]
            }
        })
    }
    console.log(contact[part.contactId])
}

watch(() => contactStateStore.contactReload,
    (newVal, oldVal) => {
        if (!newVal) {
            return
        }
        switch (newVal) {
            case 'MY':
                loadMyGroup()
                break
            case 'USER':
            case 'GROUP':
                loadContact(newVal)
                break
            case 'DISSOLUTION_GROUP':
                loadMyGroup()
                router.push('/contact/blank')
                rightTitle.value = null
                break
            case 'LEAVE_GROUP':
                loadContact('GROUP')
                router.push('/contact/blank')
                rightTitle.value = null
                break
            case 'REMOVE_USER':
                loadContact('USER')
                router.push('/contact/blank')
                rightTitle.value = null
                break
        }
        contactStateStore.setContactReload(null)
    },
    {
        immediate: true,
        deep: true
    }
)
</script>
<style lang="scss" scoped>
.drag-panel {
    height: 25px;
    background: #f7f7f7;
}

.top-search {
    padding: 0px 10px 9px 10px;
    background: #f7f7f7;
    display: flex;
    align-items: center;

    .iconfont {
        font-size: 12px;

    }
}

.contact-list {
    border-top: 1px solid #ddd;
    height: calc(100vh - 62px);
    overflow: hidden;

    &:hover {
        overflow: auto;
    }

    .part-title {
        color: #515151;
        padding-left: 10px;
        margin-top: 10px;
    }

    .part-list {
        border-bottom: 1px solid #d6d6d6;

        .part-item {
            display: flex;
            align-items: center;
            padding: 10px 10px;
            position: relative;

            &:hover {
                cursor: pointer;
                background: #d6d6d7;
            }

            .iconfont {
                width: 35px;
                height: 35px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
                color: #fff;
            }

            .text {
                flex: 1;
                color: #000000;
                margin-left: 10px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
        }

        .no-data {
            text-align: center;
            font-size: 12px;
            color: #9d9d9d;
            line-height: 30px;
        }

        .active {
            background: #c4c4c4;

            &:hover {
                background: #c4c4c4;
            }
        }
    }
}

.title-panel {
    width: 100%;
    height: 60px;
    display: flex;
    align-items: center;
    padding-left: 10px;
    font-size: 18px;
    color: #000000;
}
</style>