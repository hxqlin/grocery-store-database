<template>
  <section class="supplier-view">
    <div class="content">
      <div class="subsection">
        <span class="supplier-supplierid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Supplier ${supplier[0].supplierid}` }}</span>
        <form style="margin: 15px 15px;">
          <div style="margin: 10px 0;">
            <span class="supplier-suppliername">Supplier Name: </span>
            <input type="text" :value="supplier[0].suppliername" v-model="supplier[0].suppliername"></input>
          </div>
          <div style="margin: 10px 0;">
            <span class="supplier-supplierphone">Phone: </span>
            <input type="supplierphone" v-model="supplier[0].supplierphone"></input>
          </div>
          <div style="margin: 10px 0;">
            <span class="supplier-supplieraddress">Address: </span>
            <input type="supplieraddress" v-model="supplier[0].supplieraddress"></input>
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
        return axios.get('/api/suppliers/' + params.supplierid)
          .then((res) => {
            return { supplier: res.data }
          })
          .catch((e) => {
            error({ statusCode: 404, message: 'User not found' })
          })
      },

      data () {
        return {}
      },
      methods: {
        submitUpdate () {
          let self = this
          axios.post('/api/suppliers/updateinfo', {
            headers:
              {
                'Content-Type': 'application/json'
              },
            data:
              {
                supplierid: self.supplier.supplierid,
                suppliername: self.supplier.suppliername,
                supplierphone: self.supplier.supplierphone,
                supplieraddress: self.supplier.supplieraddress
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
          title: `Update Supplier: ${this.supplier[0].suppliername}`
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
    .supplier-supplierid
      font-size 24px
      font-weight 500
      color #707070
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
