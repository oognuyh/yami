export const isValid = ({ formId }) => {
  [...document.querySelectorAll(`#${formId} > input`)]
    .map((element) => element.validity)
    .forEach((v) => console.log(v));
};
