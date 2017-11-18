<template>
    <section class="user-view">
        <div class="content">
            <div class="subsection">
                <span class="supplier-supplierid" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Supplier #${products[0].supplierid}` }}</span>
                <span class="supplier-suppliername" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `${products[0].suppliername}` }}</span><br><br>
                <span class="supplier-supplierphone" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Phone: ${products[0].supplierphone}` }}</span><br><br>
                <span class="supplier-supplieraddress" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Address: ${products[0].supplieraddress}` }}</span><br><br>
                <nuxt-link :to="{ path: `/suppliers/${products[0].supplierid}/updateinfo`, params: { supplierid: products[0].supplierid }}">Update Info</nuxt-link><br><br><br><br>
                <span class="supplier-suppliermessage" style="padding: 10px 10px; margin: 10px 0 10px 0;">{{ `Products Supplied:` }}</span><br><br>
               <ul style="list-style-type: none; padding: 0; margin: 0;">
                <li v-for="(product, index) in products.slice(1, products.length)" :key="index" style="padding: 10px 20px; margin: 0 25px; position: relative;">
                    <nuxt-link :to="{ path: `/products/${product.productid}`, params: { productid: product.productid }}">
                        {{product.productid + ' - ' + product.productname + ' (' +  product.quantityinstock + ' in stock)'}}
                    </nuxt-link>
                </li>
               </ul>
            </div>
        </div>
    </section>
</template>

<script>
    import axios from '~/plugins/axios'

    export default {
      supplierid: 'supplierid',
      asyncData ({ params, error }) {
        return axios.get('/api/suppliers/' + params.supplierid)
          .then((res) => {
            return { products: res.data }
          })
          .catch((e) => {
            error({ statusCode: 404, message: 'Supplier not found' })
          })
      },
      head () {
        return {
          title: `Supplier ${this.products[0].supplierid}`
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
        .supplier-supplierid
            font-size 24px
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
        .supplier-suppliermessage
            font-size 24px
            font-weight 500
            color #707070
        a
            text-decoration underline
            &:hover
                color #515ec4

</style>
