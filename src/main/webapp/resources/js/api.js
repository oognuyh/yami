const CONTEXT_PATH = [...document.querySelectorAll('body')]
  .map((element) => element.dataset['contextPath'] || '')
  .join('');

const api = async ({
  path,
  method = 'post',
  body,
  before = () => {},
  after = () => {}
}) => {
  before();

  const response = await fetch(CONTEXT_PATH + path, {
    headers: {
      'Content-Type': 'application/json'
    },
    method,
    body: JSON.stringify(body)
  });

  after();

  if (response.redirected) {
    location.href = response.url;
  } else {
    return response.json();
  }
};
