document.addEventListener('DOMContentLoaded', function() {
  const $navBurger = document.getElementsByClassName('navbar-burger')[0]
  const $target = document.getElementById('navMenu')
  const $navBarEnd = document.getElementById('navBarEnd')
  const $navItemGroup = document.getElementById('navItemGroup')
  const $navBarLink = document.getElementById('navBarLink')

  $navBurger.addEventListener('click', function(el) {
    el.target.classList.toggle('is-active')
    $target.classList.toggle('is-active')
    $navBarEnd.style = 'display: flex; justify-content: flex-end; height: 50px'
  })

  $navBarLink.addEventListener(
    'mouseenter',
    e => {
      e.stopPropagation()
      $navItemGroup.classList.remove('none')
      $navItemGroup.style = 'background-color: white'
    },
    false
  )

  $navBarLink.addEventListener(
    'mouseleave',
    e => {
      e.stopPropagation()
      $navItemGroup.classList.add('none')
    },
    false
  )
})
