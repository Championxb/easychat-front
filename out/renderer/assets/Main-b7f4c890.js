import { u as useRouter, b as getCurrentInstance, r as ref, e as resolveComponent, f as openBlock, h as createElementBlock, i as createBaseVNode, F as Fragment, v as renderList, j as createVNode, w as withCtx, x as normalizeClass, m as createCommentVNode, l as createBlock, y as resolveDynamicComponent, K as KeepAlive } from "./index-2d11b61d.js";
const Main_vue_vue_type_style_index_0_lang = "";
const _hoisted_1 = { class: "main" };
const _hoisted_2 = { class: "left-sider" };
const _hoisted_3 = /* @__PURE__ */ createBaseVNode("div", null, null, -1);
const _hoisted_4 = { class: "menu-list" };
const _hoisted_5 = ["onClick"];
const _hoisted_6 = { class: "menu-list menu-button" };
const _hoisted_7 = ["onClick"];
const _hoisted_8 = { class: "right-container" };
const _sfc_main = {
  __name: "Main",
  setup(__props) {
    const router = useRouter();
    getCurrentInstance();
    const menuList = ref([
      {
        name: "chat",
        icon: "icon-chat",
        path: "/chat",
        countKey: "chatCount",
        position: "top"
      },
      {
        name: "contact",
        icon: "icon-user",
        path: "/contact",
        countKey: "contactApplyCount",
        position: "top"
      },
      {
        name: "mysetting",
        icon: "icon-more2",
        path: "/setting",
        position: "bottom"
      }
    ]);
    const currentMenu = ref(menuList.value[0]);
    const changeMenu = (item) => {
      currentMenu.value = item;
      router.push(item.path);
    };
    return (_ctx, _cache) => {
      const _component_router_view = resolveComponent("router-view");
      const _component_WinOp = resolveComponent("WinOp");
      return openBlock(), createElementBlock(Fragment, null, [
        createBaseVNode("div", _hoisted_1, [
          createBaseVNode("div", _hoisted_2, [
            _hoisted_3,
            createBaseVNode("div", _hoisted_4, [
              (openBlock(true), createElementBlock(Fragment, null, renderList(menuList.value, (item) => {
                return openBlock(), createElementBlock(Fragment, null, [
                  item.position == "top" ? (openBlock(), createElementBlock("div", {
                    key: 0,
                    class: normalizeClass(["tab-item iconfont", item.icon, item.path == currentMenu.value.path ? "active" : ""]),
                    onClick: ($event) => changeMenu(item)
                  }, [
                    item.name == "chat" ? (openBlock(), createElementBlock(Fragment, { key: 0 }, [], 64)) : createCommentVNode("", true)
                  ], 10, _hoisted_5)) : createCommentVNode("", true)
                ], 64);
              }), 256))
            ]),
            createBaseVNode("div", _hoisted_6, [
              (openBlock(true), createElementBlock(Fragment, null, renderList(menuList.value, (item) => {
                return openBlock(), createElementBlock(Fragment, null, [
                  item.position == "bottom" ? (openBlock(), createElementBlock("div", {
                    key: 0,
                    class: normalizeClass(["tab-item iconfont", item.icon, item.path == currentMenu.value.path ? "active" : ""]),
                    onClick: ($event) => changeMenu(item)
                  }, null, 10, _hoisted_7)) : createCommentVNode("", true)
                ], 64);
              }), 256))
            ])
          ]),
          createBaseVNode("div", _hoisted_8, [
            createVNode(_component_router_view, null, {
              default: withCtx(({ Component }) => [
                (openBlock(), createBlock(KeepAlive, { include: "'chat'" }, [
                  (openBlock(), createBlock(resolveDynamicComponent(Component), { ref: "componentRef" }, null, 512))
                ], 1024))
              ]),
              _: 1
            })
          ])
        ]),
        createVNode(_component_WinOp, { closeType: 0 })
      ], 64);
    };
  }
};
export {
  _sfc_main as default
};
