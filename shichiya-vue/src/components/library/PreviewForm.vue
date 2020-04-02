<template>
  <div>
    <el-dialog
      title="图书详细"
      :visible.sync="outerVisible"
      @close="clear">
      <el-form  v-model="form">
        <edit-form @onSubim="loadBooks()" ref="edit"></edit-form>
        </el-form>
    </el-dialog>
  </div>
</template>

<script>

import EditForm from './EditForm'

export default {
  name: 'Preview',
  components: {EditForm},
  data () {
    return {
      outerVisible: false,
      form: {
        id: '',
        title: '',
        author: '',
        date: '',
        press: '',
        cover: '',
        abs: '',
        category: {
          id: '',
          name: ''
        }
      },
      formLabelWidth: '120px'
    }
  },
  methods: {
    clear () {
      this.form = {
        id: '',
        title: '',
        author: '',
        date: '',
        press: '',
        cover: '',
        abs: '',
        category: {}
      }
    },
    editBooks (item) {
      this.$refs.preview.outerVisible = true
      this.$refs.preview.form = {
        id: item.id,
        cover: item.cover,
        title: item.title,
        author: item.author,
        date: item.date,
        press: item.press,
        abs: item.abs,
        category: {
          id: item.category.id.toString(),
          name: item.category.name
        }
      }
    }
  }
}
</script>

<style scoped>

</style>
