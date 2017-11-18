<template>
  <section class="employee-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      <div style="margin: 10px 0;">
        <span class="employee-employeeid">Employee ID: </span>
        <input type="employeeid" v-model="employeeid"></input>
      </div>
    </form>
    <button type="button" class="button--grey" @click="submitDelete">Delete Employee</button>
    </div>
  </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {

  data () {
    return {
      employeeid: '',
      departmentname: '',
      position: '',
      wage: '',
      sinumber: '',
      employeeaddress: '',
      employeephone: ''

    }
  },

  methods: {
    submitDelete () {
      let self = this

      axios.post('/api/employees/delete', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            employeeid: self.employeeid,
            departmentname: self.departmentname,
            position: self.position,
            wage: self.wage,
            sinumber: self.sinumber,
            employeeaddress: self.employeeaddress,
            employeephone: self.employeephone

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
      title: `Add New Employee`
    }
  }
}
</script>

<style lang="stylus" scoped>
.employee-view
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

  .employee-employeeid
    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
  &:hover
    color #515ec4

</style>
