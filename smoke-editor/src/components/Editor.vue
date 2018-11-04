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

    <div class="columns">
      <div class="column"></div>
      <template v-if="windowSize==='maximum'">
        <div class="column is-full">
          <Brace v-bind:style="{height:windowHeight +'px'}"
                 :fontsize="'12px'"
                 :theme="'xcode'"
                 :mode="selectedLanguage.tag"
                 :codefolding="'markbegin'"
                 :softwrap="'free'"
                 :selectionstyle="'text'"
                 :highlightline="true">
          </Brace>
        </div>
      </template>
      <template v-else>
        <div class="column is-half">
          <Brace v-bind:style="{height:windowHeight +'px'}"
                 :fontsize="'12px'"
                 :theme="'xcode'"
                 :mode="selectedLanguage.tag"
                 :codefolding="'markbegin'"
                 :softwrap="'free'"
                 :selectionstyle="'text'"
                 :highlightline="true">
          </Brace>
        </div>
      </template>
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
        windowHeight: 500,
        languages: languages,
        selectedLanguage: languages[0]
      }
    },
    methods: {
      maximize: function () {
        this.windowSize = 'maximum'
        this.windowHeight = 500
        // console.log('maximized')
      },
      minimize: function () {
        this.windowSize = 'minimum'
        this.windowHeight = 250
        // console.log('minimized')
      }
    }
  }
</script>
