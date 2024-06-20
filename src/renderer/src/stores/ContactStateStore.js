import { defineStore } from 'pinia'
export const useContactStateStore = defineStore('contactStateStore', {
  state: () => {
    return {
      contactReload: null,
      delContactId: null
    }
  },
  actions: {
    setContactReload(state) {
      this.contactReload = state
    },
    delContactId(delContactId) {
      this.delContactId = delContactId
    }
  }
})
