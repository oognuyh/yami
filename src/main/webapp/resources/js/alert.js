(() => {
  [...document.getElementsByClassName('alert')].forEach((element) => {
    let icon = 'info-circle';
    if (element.classList.contains('alert-success')) {
      icon = 'check-circle';
    } else if (
      element.classList.contains('alert-danger') ||
      element.classList.contains('alert-warning')
    ) {
      icon = 'exclamation-triangle';
    }

    element.insertAdjacentHTML(
      'afterbegin',
      `<i class="bi bi-${icon}-fill"></i>`
    );
  });
})();
