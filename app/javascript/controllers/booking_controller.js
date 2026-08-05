import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "template" ]
  static values = { index: Number }

  connect() {
    this.formTarget.appendChild(this.templateTarget.content.cloneNode(true))
  }

  insert() {
    const clone = this.templateTarget.content.firstElementChild.cloneNode(true)
    this.setFieldsAttributes(clone)
    this.formTarget.appendChild(clone)
    this.indexValue++
  }

  setFieldsAttributes(node) {
    const labels = node.querySelectorAll('label')
    const inputs = node.querySelectorAll('input')
    this.replaceFieldsAttrValues(labels, 'for')
    this.replaceFieldsAttrValues(inputs, 'id')
    this.replaceFieldsAttrValues(inputs, 'name')
  }

  replaceFieldsAttrValues(elements, attr) {
    elements.forEach((element) => {
      const attribute_value = element.getAttribute(attr)
      element.setAttribute(attr, attribute_value.replace(/\d/g, this.indexValue))
    })
  }

  delete(event) {
    if(this.formTarget.querySelectorAll('.passenger').length > 1){
      const node = event.target.closest('.passenger')
      this.formTarget.removeChild(node)
      this.indexValue--
    } else {
     return
    }
  }
}
