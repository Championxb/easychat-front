import { _ as _export_sfc, b as getCurrentInstance, r as ref, e as resolveComponent, f as openBlock, l as createBlock, w as withCtx, i as createBaseVNode, j as createVNode, E as withKeys, h as createElementBlock, t as toDisplayString, n as createTextVNode, m as createCommentVNode } from "./index-2d11b61d.js";
const Search_vue_vue_type_style_index_0_scoped_dc909e64_lang = "";
const _hoisted_1 = { class: "search-form" };
const _hoisted_2 = {
  key: 0,
  class: "search-result-panel"
};
const _hoisted_3 = { class: "search-result" };
const _hoisted_4 = { class: "contact-type" };
const _hoisted_5 = {
  key: 0,
  class: "op-btn"
};
const _hoisted_6 = { key: 1 };
const _hoisted_7 = {
  key: 1,
  class: "no-data"
};
const _sfc_main = {
  __name: "Search",
  setup(__props) {
    const { proxy } = getCurrentInstance();
    const searchResult = ref([]);
    const contactId = ref();
    const search = async () => {
      if (!contactId.value) {
        proxy.Message.warning("请输入用户ID或群组ID");
      }
      let result = await proxy.Request({
        url: proxy.Api.search,
        params: {
          contactId: contactId.value
        }
      });
      if (!result) {
        return;
      } else {
        searchResult.value = result.data;
      }
    };
    return (_ctx, _cache) => {
      const _component_el_input = resolveComponent("el-input");
      const _component_el_button = resolveComponent("el-button");
      const _component_ContentPanel = resolveComponent("ContentPanel");
      return openBlock(), createBlock(_component_ContentPanel, null, {
        default: withCtx(() => [
          createBaseVNode("div", _hoisted_1, [
            createVNode(_component_el_input, {
              clearable: "",
              placeholder: "请输入用户ID或群组ID",
              modelValue: contactId.value,
              "onUpdate:modelValue": _cache[0] || (_cache[0] = ($event) => contactId.value = $event),
              size: "large",
              onKeydown: withKeys(search, ["enter"])
            }, null, 8, ["modelValue"]),
            createBaseVNode("div", {
              class: "search-btn iconfont icon-search",
              onClick: search
            })
          ]),
          searchResult.value && Object.keys(searchResult.value).length > 0 ? (openBlock(), createElementBlock("div", _hoisted_2, [
            createBaseVNode("div", _hoisted_3, [
              createBaseVNode("span", _hoisted_4, toDisplayString(_ctx.contactTypeName), 1),
              createBaseVNode("div", null, toDisplayString(searchResult.value.nickName), 1)
            ]),
            searchResult.value.contactId != _ctx.userInfostore.getInfo().userld ? (openBlock(), createElementBlock("div", _hoisted_5, [
              searchResult.value.status == null || searchResult.value.status == 0 || searchResult.value.status == 2 || searchResult.value.status == 3 || searchResult.value.status == 4 ? (openBlock(), createBlock(_component_el_button, {
                key: 0,
                type: "primary",
                onClick: _ctx.applyContact
              }, {
                default: withCtx(() => [
                  createTextVNode(toDisplayString(searchResult.value.contactType == "USER" ? "添加到联系人" : "申请加入群组"), 1)
                ]),
                _: 1
              }, 8, ["onClick"])) : createCommentVNode("", true),
              createVNode(_component_el_button, {
                type: "primaryv-if= searchResult.status",
                onClick: _ctx.sendMessage
              }, {
                default: withCtx(() => [
                  createTextVNode("发消息")
                ]),
                _: 1
              }, 8, ["onClick"]),
              searchResult.value.status == 5 | searchResult.value.status == 6 ? (openBlock(), createElementBlock("span", _hoisted_6, "对方拉黑了你")) : createCommentVNode("", true)
            ])) : createCommentVNode("", true),
            !searchResult.value ? (openBlock(), createElementBlock("div", _hoisted_7, "没有搜索到任何结果")) : createCommentVNode("", true)
          ])) : createCommentVNode("", true)
        ]),
        _: 1
      });
    };
  }
};
const Search = /* @__PURE__ */ _export_sfc(_sfc_main, [["__scopeId", "data-v-dc909e64"]]);
export {
  Search as default
};
