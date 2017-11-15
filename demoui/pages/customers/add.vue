<template>
  <section class="customer-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      <div style="margin: 10px 0;">
        <span class="customer-customerid">Customer ID: </span>
        <input type="text" :value="customerid" v-model="customerid"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="customer-customername">Customer Name: </span>
        <input type="text" :value="customername" v-model="customername"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="customer-customerphone">Customer Phone: </span>
        <input type="customerphone" v-model="customerphone"></input>
      </div>
      <div style="margin: 10px 0;">
        <span class="customer-customeremail">Customer Email: </span>
        <input type="customeremail" v-model="customeremail"></input>
      </div>
    </form>
    <button type="button" class="button--grey" @click="submitInsert">Add Customer</button>
    </div>
  </div>
  </section>
</template>

<script>
import axios from '~/plugins/axios'

export default {

  data () {
    return {
      customerid: '',
      customername: '',
      customerphone: '',
      customeremail: ''
    }
  },

  methods: {
    submitInsert () {
      let self = this

      axios.post('/api/customers/add', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            customerid: self.customerid,
            customername: self.customername,
            customerphone: self.customerphone,
            customeremail: self.customeremail
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
      title: `Add New Customer`
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
  .customer-customername
    font-size 24px
    font-weight 500
    color #707070
  .customer-customerphone
    font-size 24px
    font-weight 500
    color #707070
  .customer-customerid
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
