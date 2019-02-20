document.addEventListener('DOMContentLoaded', function() {
  const $navBurger = document.getElementsByClassName('navbar-burger')[0]
  const $target = document.getElementById('navMenu')
  const $dropdownTriggers = document.getElementsByClassName('dropdown-trigger')
  const $flashMessage = document.getElementById('flashMessage')
  const $profile = document.getElementById('profile')

  if ($flashMessage) {
    setTimeout(() => {
      $flashMessage.style.margin = '70px 0 15px 0'
      $flashMessage.style.display = 'none'
      if ($profile) {
        $profile.style.marginTop = '0'
      }
    }, 2000)
  }

  if ($navBurger) {
    $navBurger.addEventListener(
      'click',
      e => {
        e.stopPropagation()
        e.target.classList.toggle('is-active')
        $target.classList.toggle('is-active')
      },
      false
    )
  }

  if ($dropdownTriggers) {
    Array.from($dropdownTriggers).forEach(trigger => {
      trigger.addEventListener(
        'click',
        e => {
          e.preventDefault()
          const $dropdown = document.getElementById(e.target.dataset.trigger)
          $dropdown.classList.toggle('is-active')
        },
        false
      )
    })
  }
})
