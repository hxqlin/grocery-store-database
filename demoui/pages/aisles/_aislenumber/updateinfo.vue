<template>
  <section class="aisle-view">
    <div class="content">
      <div class="subsection">
        <span class="aisle-aislenumber" style="padding: 10px 0 10px 10px; margin: 10px 0 10px 0;">{{`Aisle ${aisle.aislenumber}` }}</span>
        <form style="margin: 15px 15px;">
            <div style="margin: 10px 0;">
              <span class="aisle-aislename">Aisle Name: </span>
              <input type="text" :value="aisle.aislename" v-model="aisle.aislename"></input>
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
    return axios.get('/api/aisles/' + params.aislenumber)
      .then((res) => {
        return { aisle: res.data }
      })
      .catch((e) => {
        error({ statusCode: 404, message: 'Aisle not found' })
      })
  },

  data () {
    return {}
  },

  methods: {
    submitUpdate () {
      let self = this

      axios.post('/api/aisles/updateinfo', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
          {
            aislenumber: self.aisle.aislenumber,
            aislename: self.aisle.aislename
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
      title: `Update Aisle: ${this.aisle.aislename}`
    }
  }
}
</script>

<style lang="stylus" scoped>
.aisle-view
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
  .aisle-aislenumber
    font-size 24px
    font-weight 500
    color #707070
  .aisle-aislename
    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
    &:hover
      color #515ec4

</style>
