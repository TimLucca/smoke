import Editor from '@/components/Editor'
import { mount } from './utils'

describe('Editor.vue', () => {
  it('should default to full size', () => {
    const vm = mount(Editor)
    expect(vm.windowSize).to.equal('maximum')
  })
  it('should change to the small size', () => {
    const vm = mount(Editor)
    vm.minimize()
    expect(vm.windowSize).to.equal('minimum')
  })

  it('should change back to default size', () => {
    const vm = mount(Editor)
    vm.minimize()
    vm.maximize()
    expect(vm.windowSize).to.equal('maximum')
  })
})
