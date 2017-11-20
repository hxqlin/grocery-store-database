<template>
  <section class="user-view">
    <div class="content">
      <div class="subsection">
<<<<<<< HEAD
        <span class="customer-customerid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Spending Breakdown for Customer #${this.$route.params.customerid}` }}</span>
        <li v-for="(total, index) in totals" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
          <span class="customer-totals" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${total.departmentname + " Total: $" + total.sum}` }}</span><br><br>
=======
        <span class="customer-heading" style="padding: 10px 10px; margin: 10px 0 10px 0;">Spending Breakdown:</span><br><br>
        <li v-for="(total, index) in totals" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
          <span class="customer-totals" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${total.departmentname + " Department: $" + total.sum + " total."}` }}</span>
>>>>>>> 8d9f13554a3aa168f27f314e893d626cca76d4c1
        </li>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  customerid: 'customerid',
  asyncData ({ params, error }) {
    return axios.get('/api/customers/spendingbreakdown/' + params.customerid)
      .then((res) => {
        return { totals: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Customer not found' })
      })
  },
  head () {
    return {
      title: `Customer Totals`
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
  .customer-heading
    font-size 24px
    font-weight 500
    color #707070
  .customer-customertotals
    font-size 16px
    font-weight 500
    color #707070
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
