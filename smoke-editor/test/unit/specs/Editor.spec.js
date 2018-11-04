import Editor from '@/components/Editor'
import { mount } from './utils'

describe('Editor.vue', () => {
  it('should default to full size', () => {
    const vm = mount(Editor)
    expect(vm.windowSize).to.equal('maximum')
  })
})
