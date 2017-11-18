<template>
  <section class="customer-view">
    <div class="content">
      <div class="subsection">
        <span class="customer-customerid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Customer ${customer[0].customerid}` }}</span>
        <form style="margin: 15px 15px;">
            <div style="margin: 10px 0;">
              <span class="customer-customername">Customer Name: </span>
              <input type="text" :value="customer[0].customername" v-model="customer[0].customername"></input>
            </div>
            <div style="margin: 10px 0;">
              <span class="customer-customerphone">Phone: </span>
              <input type="customerphone" v-model="customer[0].customerphone"></input>
            </div>
            <div style="margin: 10px 0;">
              <span class="customer-customeremail">Email: </span>
              <input type="customeremail" v-model="customer[0].customeremail"></input>
            </div>
        </form>
        <button type="button" class="button--grey" @click="submitUpdate">Update</button>
      </div>
    </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {
  asyncData ({ params, error }) {
    return axios.get('/api/customers/' + params.customerid)
      .then((res) => {
        return { customer: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Customer not found' })
      })
  },

  data () {
    return {}
  },

  methods: {
    submitUpdate () {
      let self = this

      axios.post('/api/customers/updateinfo', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            customerid: self.customer.customerid,
            customername: self.customer.customername,
            customerphone: self.customer.customerphone,
            customeremail: self.customer.customeremail
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
      title: `Update Customer: ${this.customer[0].customername}`
    }
  }
}
</script>

<style lang="stylus" scoped>
.customer-view
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
    color #707070
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
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
