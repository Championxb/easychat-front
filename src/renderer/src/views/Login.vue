<template>
    <div class="login-panel">
        <div class="title drag">EasyChat</div>
        <div v-if="showLoading" class="loading-panel">
            <img src="../assets/img/loading.gif" alt="">
        </div>
        <div class="login-form" v-else>
            <div class="error-msg"> {{ errorMsg }}</div>
            <el-form :model="formData" ref="formDataRef" label-width="0px" @submit.prevent>
                <el-form-item prop="email">
                    <el-input size="large" clearable placeholder="请输入邮箱" maxLength="30" @focus="clearVerify"
                        v-model.trim="formData.email">
                        <template #prefix>
                            <span class="iconfont icon-email"></span>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item prop="nickname" v-if="!isLogin">
                    <el-input size="large" clearable placeholder="请输入昵称" maxLength="15" @focus="clearVerify"
                        v-model.trim="formData.nickName">
                        <template #prefix>
                            <span class="iconfont icon-user-nick"></span>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input show-password size="large" clearable placeholder="请输入密码" v-model.trim="formData.password"
                        @focus="clearVerify">
                        <template #prefix>
                            <span class="iconfont icon-password"></span>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item prop="rePassword" v-if="!isLogin">
                    <el-input show-password size="large" clearable placeholder="请再输入密码"
                        v-model.trim="formData.rePassword" @focus="clearVerify">
                        <template #prefix>
                            <span class="iconfont icon-password"></span>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item prop="checkcode">
                    <div class="check-code-panel">
                        <el-input size="large" clearable placeholder="请输入验证码" @focus="clearVerify"
                            v-model.trim="formData.checkCode">
                            <template #prefix>
                                <span class="iconfont icon-checkcode"></span>
                            </template>
                        </el-input>
                        <img :src="checkCodeUrl" class="check-code" @click="changeCheckCocde">
                    </div>
                </el-form-item>
                <!-- <el-form-item prop="email"> -->
                <el-button type="primary" class="login-btn" @click="submit">
                    {{ !isLogin ? '注册' : '登录' }}
                </el-button>
                <!-- </el-form-item> -->
                <div class="bottom-link" @click="changeOpType">
                    <span class="a-link">{{ !isLogin ? '已有帐号' : '没有账号？' }}</span>
                </div>
            </el-form>
        </div>
    </div>
    <WinOp :showSetTop="false" :showMin="false" :showMax="false" :closeType="θ"></WinOp>
</template>

<script setup>
import { ref, reactive, getCurrentInstance, nextTick, onMounted } from 'vue';
import { useUserInfoStore } from '@/stores/UserInfoStore';
import { useRouter } from 'vue-router';
import md5 from 'js-md5';
const { proxy } = getCurrentInstance()
const userInfoStore = useUserInfoStore();
const router = useRouter();

const formData = ref([]);
const formDataRef = ref(null);
onMounted(() => {
    changeCheckCocde();
})
const isLogin = ref(true);
const changeOpType = () => {
    window.ipcRenderer.send('loginOrRegister', !isLogin.value);
    isLogin.value = !isLogin.value;
    nextTick(() => {
        formDataRef.value.resetFields();
        formData.value = {};
        clearVerify();
        changeCheckCocde();
    });
}

//获取验证码
const checkCodeUrl = ref(null);
const changeCheckCocde = async () => {
    let result = await proxy.Request({
        url: proxy.Api.checkCode,
    });
    if (!result) {
        return;
    }
    checkCodeUrl.value = result.data.checkCode;
    localStorage.setItem('checkCodeKey', result.data.checkCodeKey);
}
const errorMsg = ref(null);
const showLoading = ref(false);
const submit = async () => {
    clearVerify();
    if (!checkValue('checkEmail', formData.value.email, '请输入正确的邮箱')) {
        return;
    }
    if (!isLogin.value && !checkValue(null, formData.value.nickName, '请输入昵称')) {
        return;
    }
    if (!checkValue('checkPassword', formData.value.password, '密码只能是数字、字母、特殊字符8~18位')) {
        return;
    }

    if (!isLogin.value && formData.value.password !== formData.value.rePassword) {
        errorMsg.value = '两次密码不一致';
        return;
    }
    if (!checkValue(null, formData.value.checkCode, '请输入正确的验证码')) {
        return;
    }
    if (isLogin.value) {
        showLoading.value = true;
    }
    let result = await proxy.Request({
        url: isLogin.value ? proxy.Api.login : proxy.Api.register,
        showError: false,
        showLoading: isLogin.value ? false : true,
        params: {
            email: formData.value.email,
            nickName: formData.value.nickName,
            password: isLogin.value ? md5(formData.value.password) : formData.value.password,
            checkCode: formData.value.checkCode,
            checkCodeKey: localStorage.getItem('checkCodeKey')
        },
        errorCallback: (response) => {
            showLoading.value = false;
            errorMsg.value = response.info;
            changeCheckCocde();
        }
    })
    if (!result) {
        return;
    }
    if (isLogin.value) {
        userInfoStore.setInfo(result.data);
        localStorage.setItem('token', result.data.token);
        router.push('/main')
        const screeenWidth = window.screen.width;
        const screeenHeight = window.screen.height;
        window.ipcRenderer.send('openChat',
            {
                email: formData.value.email,
                token: result.data.token,
                userId: result.data.userId,
                nickName: result.data.nickName,
                admin: result.data.admin,
                screeenWidth: screeenWidth,
                screeenWidth: screeenHeight
            })
    } else {
        proxy.Message.success('登录成功');
        changeOpType();
    }
}

const checkValue = (type, value, msg) => {
    if (proxy.Utils.isEmpty(value)) {
        errorMsg.value = msg;
        return false;
    }
    if (type && !proxy.Verify[type](value)) {
        errorMsg.value = msg;
        return false;
    }
    return true;
}
const clearVerify = () => {
    errorMsg.value = '';
}
</script>

<style lang="scss" scoped>
.email-select {
    width: 250px;
}

.loading-panel {
    height: calc(100vh - 32px);
    display: flex;
    justify-self: center;
    align-items: center;
    overflow: hidden;

    img {
        width: 100px;
    }
}

.login-panel {
    background: #fff;
    border-radius: 3px;
    border: 1px solid #ddd;


    .title {
        height: 30px;
        padding: 5px 0px 0px 10px;
    }

    .login-form {
        padding: 0px 15px 29px 15px;

        :deep(.el-input__wrapper) {
            box-shadow: none;
            border-radius: none;
            border: none;
        }

        .el-form-item {
            border-bottom: 1px solid #ddd;
        }

        .email-panel {
            align-items: center;
            width: 100%;
            display: flex;

            .input {
                flex: 1;
            }

            .icon-down {
                margin-left: 3px;
                width: 16px;
                cursor: pointer;
                border: none;
            }
        }

        .check-code-panel {
            display: flex;

            .check-code {
                cursor: pointer;
                width: 120px;
                margin-left: 5px;
            }
        }

        .error-msg {
            color: #f56c6c;
            margin-bottom: 10px;
        }

        .check-code-panel {
            display: flex;

            .check-code {
                cursor: pointer;
                width: 120px;
                margin-left: 5px;
            }
        }

        .login-btn {
            width: 100%;
            margin-top: 20px;
            background: #07c160;
            height: 36px;
            font-size: 16px;
        }

        .bottom-link {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;

            .a-link {
                color: #409eff;
                cursor: pointer;
            }
        }
    }
}
</style>
