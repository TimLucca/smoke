<template>
  <div class = "editor">
    <b-dropdown v-model="selectedLanguage">
      <button slot="trigger" class="button is-primary">
        <span>{{ selectedLanguage.name }}</span>
        <b-icon icon="arrow-down"/>
      </button>

      <b-dropdown-item v-for="lang in languages"
                       v-bind:value="lang"
                       v-bind:key="lang.name">
        {{ lang.name }}
      </b-dropdown-item>
    </b-dropdown>

    <!--Both Button-->
    <a class="button is-small is-pulled-right">
      <template v-if="windowSize==='maximum'">
        <span class="icon is-small " v-on:click="minimize()">
          <font-awesome-icon icon="window-minimize" />
        </span>
      </template>
      <template v-else>
        <span class="icon is-small " v-on:click="maximize()">
          <font-awesome-icon icon="window-maximize" />
        </span>
      </template>
    </a>

    <!--Maximize Button
    <a class="button is-small  is-pulled-right">
      <span class="icon is-small " v-on:click="maximize()">
      <font-awesome-icon icon="window-maximize" />
    </span>
    </a>

    <a class="button is-small  is-pulled-right">
    <span class="icon is-small " v-on:click="minimize()">
      <font-awesome-icon icon="window-minimize" />
    </span>
    </a> -->


    <div class="columns">
      <div class="column"></div>
      <div class="column is-full">
        <brace style="height:500px"
               :fontsize="'12px'"
               :theme="'xcode'"
               :mode="selectedLanguage.tag"
               :codefolding="'markbegin'"
               :softwrap="'free'"
               :selectionstyle="'text'"
               :highlightline="true">
        </brace>
      </div>
    </div>
  </div>
</template>


<script>
  import Vue from 'vue'
  import Brace from 'vue-bulma-brace'
  import Buefy from 'buefy'
  // import 'buefy/lib/buefy.css'
  Vue.use(Buefy)
  export default{
    components: {
      Brace
    },
    data: function () {
      let languages = [
        {
          name: 'Python 3',
          tag: 'python'
        },
        {
          name: 'Python 2',
          tag: 'python'
        },
        {
          name: 'Ruby',
          tag: 'ruby'
        },
        {
          name: 'Java',
          tag: 'java'
        },
        {
          name: 'JavaScript',
          tag: 'javascript'
        }
      ]
      return {
        windowSize: 'maximum',
        languages: languages,
        selectedLanguage: languages[0]
      }
    },
    methods: {
      maximize: function () {
        this.windowSize = 'maximum'
        console.log('maximized')
      },
      minimize: function () {
        this.windowSize = 'minimum'
        console.log('minimized')
      }
    }
  }
</script>
