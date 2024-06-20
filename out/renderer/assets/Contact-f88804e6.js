import { _ as _export_sfc, b as getCurrentInstance, u as useRouter, r as ref, z as useRoute, e as resolveComponent, A as resolveDirective, f as openBlock, l as createBlock, w as withCtx, i as createBaseVNode, B as withDirectives, h as createElementBlock, v as renderList, t as toDisplayString, F as Fragment, x as normalizeClass, C as unref, D as normalizeStyle, m as createCommentVNode, j as createVNode, y as resolveDynamicComponent, p as pushScopeId, q as popScopeId } from "./index-2d11b61d.js";
const Contact_vue_vue_type_style_index_0_scoped_c5dbe0bc_lang = "";
const _withScopeId = (n) => (pushScopeId("data-v-c5dbe0bc"), n = n(), popScopeId(), n);
const _hoisted_1 = /* @__PURE__ */ _withScopeId(() => /* @__PURE__ */ createBaseVNode("div", { class: "drag-panel drag" }, null, -1));
const _hoisted_2 = { class: "top-search" };
const _hoisted_3 = /* @__PURE__ */ _withScopeId(() => /* @__PURE__ */ createBaseVNode("span", { class: "iconfont icon-search" }, null, -1));
const _hoisted_4 = { class: "contact-list" };
const _hoisted_5 = { class: "part-title" };
const _hoisted_6 = { class: "part-list" };
const _hoisted_7 = ["onClick"];
const _hoisted_8 = { class: "text" };
const _hoisted_9 = {
  key: 0,
  class: "no-data"
};
const _hoisted_10 = { class: "title-panel drag" };
const _sfc_main = {
  __name: "Contact",
  setup(__props) {
    getCurrentInstance();
    const router = useRouter();
    const searchKey = ref("");
    const route = useRoute();
    const rightTitle = ref("聊天窗口");
    const partList = ref([
      {
        partName: "新朋友",
        children: [
          {
            name: "搜好友",
            icon: "icon-search",
            iconBgColor: "#fa9d3b",
            path: "/contact/search"
          },
          {
            name: "新的朋友",
            icon: "icon-plane",
            iconBgColor: "#08bf61",
            path: "/contact/contactNotice",
            showTitle: true,
            countKey: "contactApplyCount"
          }
        ]
      },
      {
        partName: "我的群聊",
        children: [
          {
            name: "新建群聊",
            icon: "icon-add-group",
            iconBgColor: "#1485ee",
            path: "/contact/createGroup",
            contactId: "groupId",
            contactName: "groupName",
            showTitle: true,
            contactData: [],
            contactPath: "/contact/groupDetail"
          }
        ]
      },
      {
        partName: "我加入的群聊",
        contactId: "contactId",
        contactName: "contactName",
        showTitle: true,
        contactData: [],
        ontactPath: "/contact/groupDetail",
        emptyMsg: "暂未加入群聊"
      },
      {
        partName: "我的好友",
        children: [],
        contactId: "contactId",
        contactName: "contactName",
        contactData: [],
        contactPath: "/contact/userDetail",
        emptyMsg: "暂无好友"
      }
    ]);
    const partJump = (data) => {
      if (data.showTitle) {
        rightTitle.value = data.name;
      } else {
        rightTitle.value = null;
      }
      router.push(data.path);
    };
    return (_ctx, _cache) => {
      const _component_el_input = resolveComponent("el-input");
      const _component_tempplate = resolveComponent("tempplate");
      const _component_router_view = resolveComponent("router-view");
      const _component_Layout = resolveComponent("Layout");
      const _directive_moldel = resolveDirective("moldel");
      return openBlock(), createBlock(_component_Layout, null, {
        "left-content": withCtx(() => [
          _hoisted_1,
          createBaseVNode("div", _hoisted_2, [
            withDirectives((openBlock(), createBlock(_component_el_input, {
              clearable: "",
              placeholder: "搜索",
              size: "small",
              onKeyup: _ctx.search
            }, {
              suffix: withCtx(() => [
                _hoisted_3
              ]),
              _: 1
            }, 8, ["onKeyup"])), [
              [_directive_moldel, searchKey.value]
            ])
          ]),
          createBaseVNode("div", _hoisted_4, [
            (openBlock(true), createElementBlock(Fragment, null, renderList(partList.value, (part) => {
              return openBlock(), createBlock(_component_tempplate, null, {
                default: withCtx(() => [
                  createBaseVNode("div", _hoisted_5, toDisplayString(part.partName), 1),
                  createBaseVNode("div", _hoisted_6, [
                    (openBlock(true), createElementBlock(Fragment, null, renderList(part.children, (sub) => {
                      return openBlock(), createElementBlock("div", {
                        class: normalizeClass(["part-item", sub.path == unref(route).path ? "active" : ""]),
                        onClick: ($event) => partJump(sub)
                      }, [
                        createBaseVNode("div", {
                          class: normalizeClass(["iconfont", sub.icon]),
                          style: normalizeStyle({ background: sub.iconBgColor })
                        }, null, 6),
                        createBaseVNode("div", _hoisted_8, toDisplayString(sub.name), 1)
                      ], 10, _hoisted_7);
                    }), 256)),
                    (openBlock(true), createElementBlock(Fragment, null, renderList(part.contactData, (contact) => {
                      return openBlock(), createElementBlock(Fragment, null, [], 64);
                    }), 256)),
                    part.contactData && part.contactData.length == 0 ? (openBlock(), createElementBlock("div", _hoisted_9, toDisplayString(part.emptyMsg), 1)) : createCommentVNode("", true)
                  ])
                ]),
                _: 2
              }, 1024);
            }), 256))
          ])
        ]),
        "right-content": withCtx(() => [
          createBaseVNode("div", _hoisted_10, toDisplayString(rightTitle.value), 1),
          createVNode(_component_router_view, null, {
            default: withCtx(({ Component }) => [
              (openBlock(), createBlock(resolveDynamicComponent(Component), { ref: "componentRef" }, null, 512))
            ]),
            _: 1
          })
        ]),
        _: 1
      });
    };
  }
};
const Contact = /* @__PURE__ */ _export_sfc(_sfc_main, [["__scopeId", "data-v-c5dbe0bc"]]);
export {
  Contact as default
};
