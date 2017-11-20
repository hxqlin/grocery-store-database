<template>
  <section class="supplier-view">
    <div class="content">
      <div class="subsection">
        <form style="margin: 15px 15px;">

          <div style="margin: 10px 0;">
            <span class="supplier-suppliername">Supplier Name: </span>
            <input type="text" :value="suppliername" v-model="suppliername"></input>
          </div>
          <div style="margin: 10px 0;">
            <span class="supplier-supplierphone">Supplier Phone: </span>
            <input type="supplierphone" v-model="supplierphone"></input>
          </div>
          <div style="margin: 10px 0;">
            <span class="supplier-supplieraddress">Supplier Address: </span>
            <input type="supplieraddress" v-model="supplieraddress"></input>
          </div>
        </form>
        <button type="button" class="button--grey" @click="submitInsert">Add Supplier</button>
      </div>
    </div>
  </section>
</template>

<script>
    import axios from '~/plugins/axios'

    export default {
      data () {
        return {
          supplierid: '',
          suppliername: '',
          supplierphone: '',
          supplieraddress: ''
        }
      },
      methods: {
        submitInsert () {
          let self = this
          axios.post('/api/suppliers/add', {
            headers:
              {
                'Content-Type': 'application/json'
              },
            data:
              {
                supplierid: self.supplierid,
                suppliername: self.suppliername,
                supplierphone: self.supplierphone,
                supplieraddress: self.supplieraddress
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
          title: `Add New Supplier`
        }
      }
    }
</script>

<style lang="stylus" scoped>
  .supplier-view
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
    .supplier-suppliername
      font-size 24px
      font-weight 500
      color #707070
    .supplier-supplierphone
      font-size 24px
      font-weight 500
      color #707070
    .supplier-supplieraddress
      font-size 24px
      font-weight 500
      color #707070
    a
      text-decoration underline
    &:hover
      color #515ec4

</style>
