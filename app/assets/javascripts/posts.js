const triggers = document.getElementsByClassName('dropdown-trigger')

for (var i = 0; i < triggers.length; i++) {
  console.log('i', i)
  triggers[i].addEventListener('click', function() {
    const d = document.getElementsByClassName('dropdown')[0]
    console.log(d)
    d.classList.toggle('is-active')
  })
}

