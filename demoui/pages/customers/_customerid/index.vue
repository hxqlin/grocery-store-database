<template>
  <section class="user-view">
    <div class="content">
      <div class="subsection">
        <span class="customer-customerid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Customer #${transactions[0].customerid}` }}</span>
        <span class="customer-customername" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${transactions[0].customername}` }}</span><br><br>
        <span class="customer-customerphone" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Phone: ${transactions[0].customerphone}` }}</span><br><br>
        <span class="customer-customeremail" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Email: ${transactions[0].customeremail}` }}</span><br><br>
        <nuxt-link :to="{ path: `/customers/${transactions[0].customerid}/updateinfo`, params: { customerid: transactions[0].customerid }}">Update Info</nuxt-link><br><br>
        <nuxt-link :to="{ path: `/customers/${transactions[0].customerid}/spendingBreakdown`, params: { customerid: transactions[0].customerid }}">View Spending Breakdown</nuxt-link><br><br><br>
        <span class="customer-heading" style="padding: 10px 10px; margin: 10px 0 10px 0;">Transactions:</span><br>
        <li v-for="(transaction, index) in transactions.slice(1, transactions.length)" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
          <span class="customer-transactions" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Transaction #${transaction.transactionid + " on " + transaction.purchasedate + ": " + transaction.productname + " x" + transaction.quantity + " totaling $" + transaction.total}` }}</span><br>
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
    return axios.get('/api/customers/' + params.customerid)
      .then((res) => {
        return { transactions: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Product not found' })
      })
  },
  head () {
    return {
      title: `Customer ${this.transactions[0].customerid}`
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
  .customer-customerid
    font-size 24px
    font-weight 500
  .customer-customername
    font-size 24px
    font-weight 500
    color #707070
  .customer-customerphone
    font-size 24px
    font-weight 500
    color #707070
  .customer-customeremail
    font-size 24px
    font-weight 500
    color #707070
  .customer-heading
    font-size 20px
    font-weight 500
    color #707070
  .customer-transactions
    font-size 16px
    font-weight 500
    color #707070
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
