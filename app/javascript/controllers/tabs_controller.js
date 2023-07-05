import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = [ 'tab', 'tabContent', 'avatarContent' ]
  
  change(e){
    this.index = this.tabTargets.indexOf(e.target)
    this.showContent(this.index)
  }

  toggle(){
    this.avatarContentTarget.classList.toggle('is-hidden')
  }

  hide(e){
    if (e.target !== this.avatarContentTarget.previousElementSibling){
      this.avatarContentTarget.classList.add('is-hidden')
    }
    }

  showContent(){
    this.tabTargets.forEach((element, index) => {
      if (index == this.index) {
        element.classList.add('active')
      } else {
        element.classList.remove('active')
      }
    })
    
    this.tabContentTargets.forEach((element, index) => {
      if (index == this.index) {
        element.classList.remove('is-hidden')
      } else {
        element.classList.add('is-hidden')
      }
    })
  }

  log(e){
    console.log(window.innerWidth)
  }
}