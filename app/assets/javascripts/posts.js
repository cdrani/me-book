const triggers = document.getElementsByClassName('dropdown-trigger')

Array.from(triggers).forEach(el => {
  el.addEventListener('click', e => {
    e.stopPropagation()
    const parent = e.target.closest('.group--apart')
    console.log('parent', parent)
    const dropdown = parent.closest('.dropdown')
    dropdown.classList.toggle('is-active')
  })
})
