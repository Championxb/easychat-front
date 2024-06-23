import { defineStore } from 'pinia'
export const useContactStateStore = defineStore('contactStateStore', {
  state: () => {
    return {
      contactReload: null
    }
  },
  actions: {
    setContactReload(state) {
      this.contactReload = state
    }
  }
})
