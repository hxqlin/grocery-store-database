<template>
  <section class="employee-view">
    <div class="content">
      <div class="subsection">
      <span class="employee-employeeid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Employee ${employees.employeeid}` }}
        </span>
        <span class="employee-employeename" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${employees.employeename}` }}
        </span>
        <span class="employee-position" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${employees.position}` }}
        </span>
        <br><br>

        <form style="margin: 15px 15px;">
            
        </form>
        <button type="button" class="button--red" @click="submitDelete">FIRE</button>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  asyncData ({ params, error }) {
    return axios.get('/api/employees/' + params.employeeid)
      .then((res) => {
        return { employees: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Employee not found' })
      })
  },
  data () {
    return {

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
            employeeid: self.employees.employeeid,
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
      title: `Delete Employee ${this.employees.employeeid}`
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
