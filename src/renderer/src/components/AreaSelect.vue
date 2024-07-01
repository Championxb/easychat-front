<template>
    <div>
        <el-cascader :options="AreaData" v-model="modelValue.areaCode" @change="change" ref="areaSelectRef" clearable />
    </div>
</template>
<script setup>
import { ref, reactive, getCurrentInstance, nextTick } from "vue"
const { proxy } = getCurrentInstance();
import AreaData from "./AreaData"
import { useRoute, useRouter } from "vue-router"
const route = useRoute()
const router = useRouter()

const props = defineProps({
    modelValue: {
        type: Object,
        default: () => {
            return {
                areaCode: []
            }
        }
    }
})
const areaSelectRef = ref()
const emit = defineEmits(['upadate:modelValue'])
const change = (val) => {
    const areaData = {
        areaName: [],
        areaCode: []
    }
    const checkedNodes = areaSelectRef.value.getCheckedNodes()[0]
    if (!checkedNodes) {
        emit('update:modelValue', areaData)
        return
    }
    const pathValue = checkedNodes.pathValues
    const pathLabels = checkedNodes.pathLabels
    areaData.areaName = pathLabels
    areaData.areaCode = pathValue
    emit('update:modelValue', areaData)
}
</script>
<style lang=" scss" scoped></style>
