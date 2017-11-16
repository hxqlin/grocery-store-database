<template>
  <section class="department-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      <div style="margin: 10px 0;">
        <span class="department-departmentname">Department Name: </span>
        <input type="text" :value="departmentname" v-model="departmentname"></input>
      </div>
    </form>
    <button type="button" class="button--grey" @click="submitInsert">Add Department</button>
    </div>
  </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {

  data () {
    return {
      departmentname: ''
    }
  },

  methods: {
    submitInsert () {
      let self = this

      axios.post('/api/departments/add', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            departmentname: self.departmentname
          }})
        .then((res) => {
          // res.data should contain the url for redirecting... bad practice
          self.$nuxt.$router.replace({ path: res.data })
        })
        .catch((e) => {
          console.log(e)
        })
    }
  },

  head () {
    return {
      title: `Add New Department`
    }
  }
}
</script>

<style lang="stylus" scoped>
.department-view
  padding-top 0

.content
  position absolute
  width 100%

.subsection
  background-color #fff
  border-radius 2px
  margin 25px 0
  transition all .5s cubic-bezier(.55,0,.1,1)
  padding 10px 30px 10px 30px
  position relative
  line-height 20px
  .subsection-title
    margin 25px 10px
    font-size 26px
    font-weight 500
  .department-departmentname
    font-size 24px
    font-weight 500
    color #707070

  a
    text-decoration underline
  &:hover
    color #515ec4

</style>
