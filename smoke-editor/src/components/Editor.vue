<template>
  <div class = "editor">
<<<<<<< HEAD
    <b-dropdown v-model="mode">
      <button class="button is-primary" type="button" slot="trigger">
        <template v-if="'Python 3'">
          <span>Python 3</span>
        </template>
        <template v-else-if="'Python 2'">
          <span>Python 2</span>
        </template>
        <template v-else-if="'Ruby'">
          <span>Ruby</span>
        </template>
        <template v-else-if="'Java'">
          <span>Java</span>
        </template>
=======
    <b-dropdown v-model="selectedLanguage">
      <button slot="trigger" class="button is-primary">
        <span>{{ selectedLanguage.name }}</span>
        <b-icon icon="arrow-down"/>
>>>>>>> Develop
      </button>

      <b-dropdown-item v-for="lang in languages"
                       v-bind:value="lang"
                       v-bind:key="lang.name">
                       {{ lang.name }}
      </b-dropdown-item>
      <b-dropdown-item :value="'Ruby'">
        <div class="dropdown-content" @click="changeMode('Ruby')">
          <div class="dropdown-item">
            <h3>Ruby</h3>
          </div>
        </div>
      </b-dropdown-item>
      <b-dropdown-item :value="'Java'">
        <div class="dropdown-content" @click="changeMode('Java')">
          <div class="dropdown-item">
            <h3>Java</h3>
          </div>
        </div>
      </b-dropdown-item>
    </b-dropdown>

    <brace style="height: 500px"
           :fontsize="'12px'"
           :theme="'github'"
           :mode="selectedLanguage.tag"
           :codefolding="'markbegin'"
           :softwrap="'free'"
           :selectionstyle="'text'"
           :highlightline="true">
    </brace>
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
      },
      {
        name: 'C++',
        tag: 'cpp'
      },
      {
        name: 'Erlang',
        tag: 'erlang'
      }
    ]
    return {
      languages: languages,
      selectedLanguage: languages[0]
    }
  }
}
</script>
