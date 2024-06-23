import { createApp } from 'vue'
import App from './App.vue'
import router from '@/router'
import * as Pinia from 'pinia'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import '@/assets/icon/iconfont.css'
import '@/assets/cust-elementplus.scss'
import '@/assets/base.scss'

import Layout from '@/components/Layout.vue'
import WinOp from '@/components/WinOp.vue'
import ContentPanel from '@/components/ContentPanel.vue'
import ShowLocalImage from '@/components/ShowLocalImage.vue'
import UserBaseInfo from '@/components/UserBaseInfo.vue'
import Dialog from './components/Dialog.vue'
import Avatar from './components/Avatar.vue'
import AvatarUpload from './components/AvatarUpload.vue'
import Utils from '@/utils/Utils.js'
import Verify from '@/utils/Verify.js'
import Request from '@/utils/Request.js'
import Message from '@/utils/Message.js'
import Api from '@/utils/Api.js'
import Confirm from '@/utils/Confirm.js'

const app = createApp(App)
app.use(router)
app.use(Pinia.createPinia())
app.use(ElementPlus)

app.component('Layout', Layout)
app.component('WinOp', WinOp)
app.component('ContentPanel', ContentPanel)
app.component('ShowLocalImage', ShowLocalImage)
app.component('UserBaseInfo', UserBaseInfo)
app.component('Dialog', Dialog)
app.component('Avatar', Avatar)
app.component('AvatarUpload', AvatarUpload)

app.config.globalProperties.Utils = Utils
app.config.globalProperties.Verify = Verify
app.config.globalProperties.Request = Request
app.config.globalProperties.Message = Message
app.config.globalProperties.Api = Api
app.config.globalProperties.Confirm = Confirm

app.mount('#app')
