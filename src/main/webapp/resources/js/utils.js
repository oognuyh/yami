function togglePassword({ dataset: { toggleTarget }, firstElementChild }) {
  const toggleTargetElement = document.getElementById(toggleTarget);
  if (toggleTargetElement.type === 'password') {
    toggleTargetElement.type = 'text';
    firstElementChild.className = 'bi bi-eye-slash-fill';
  } else {
    toggleTargetElement.type = 'password';
    firstElementChild.className = 'bi bi-eye-fill';
  }
}
