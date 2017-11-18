<template>
  <section class="employee-view">
    <div class="content">
      <div class="subsection">
        <span class="employee-employeeid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Employee #${employees.employeeid}` }}</span>
        <span class="employee-employeename" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${employees.employeename}` }}</span><br><br>
        <span class="employee-employeeattributes" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Department: ${employees.departmentname}` }}</span><br><br>
        <span class="employee-employeedepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Position: ${employees.position}` }}</span><br><br>
        <span class="employee-employeedepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `SINumber: ${employees.sinumber}` }}</span><br><br>
        <span class="employee-employeedepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Address: ${employees.employeeaddress}` }}</span><br><br>
        <span class="employee-employeedepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Phone: ${employees.employeephone}` }}</span><br><br>
        <span class="employee-employeedepartmentname" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Wage: $${employees.wage}/hr` }}</span><br><br>
        <nuxt-link :to="{ path: `/employees/${employees.employeeid}/update`, params: { employeeid: employees.employeeid }}">Update Info</nuxt-link><br><br>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  employeeid: 'employeeid',
  asyncData ({ params, error }) {
    return axios.get('/api/employees/' + params.employeeid)
      .then((res) => {
        return { employees: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Product not found' })
      })
  },
  head () {
    return {
      title: `Employee ${this.employees.employeeid}`
    }
  }
}
</script>

<style lang="stylus" scoped>
.user-view
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
  .employee-employeename
    font-size 24px
    font-weight 500
    color #707070
  .employee-employeeattributes
    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
