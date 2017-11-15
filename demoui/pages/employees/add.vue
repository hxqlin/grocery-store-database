<template>
  <section class="employee-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      <div style="margin: 10px 0;">
        <span class="employee-employeeid">Employee ID: </span>
        <input type="text" :value="employeeid" v-model="employeeid"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="employee-employeename">Employee Name: </span>
        <input type="employeename" v-model="employeename"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="employee-departmentname">Department Name: </span>
        <input type="text" :value="departmentname" v-model="departmentname"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="employee-position">Position: </span>
        <input type="text" :value="position" v-model="position"></input>
      </div>


      <div style="margin: 10px 0;">
        <span class="employee-wage">Wage: </span>
        <input type="text" :value="wage" v-model="wage"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="employee-sinumber">SINumber: </span>
        <input type="text" :value="sinumber" v-model="sinumber"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="employee-employeeaddress">Address: </span>
        <input type="text" :value="employeeaddress" v-model="employeeaddress"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="employee-employeephone">Phone: </span>
        <input type="text" :value="employeephone" v-model="employeephone"></input>

      </div>
    </form>
    <button type="button" class="button--grey" @click="submitInsert">Add Employee</button>
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
      employeename: '',
      departmentname: '',
      position: '',

      wage: '',
      sinumber: '',
      employeeaddress: '',
      employeephone: ''

    }
  },

  methods: {
    submitInsert () {
      let self = this

      axios.post('/api/employees/add', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            employeeid: self.employeeid,
            employeename: self.employeename,
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
  .employee-employeename
    font-size 24px
    font-weight 500
    color #707070
  .employee-departmentname
    font-size 24px
    font-weight 500
    color #707070
  .employee-position

    font-size 24px
    font-weight 500
    color #707070
  .employee-wage
    font-size 24px
    font-weight 500
    color #707070

  .employee-sinumber
    font-size 24px
    font-weight 500
    color #707070

  .employee-employeeaddress
    font-size 24px
    font-weight 500
    color #707070
  .employee-employeephone

    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
  &:hover
    color #515ec4

</style>
