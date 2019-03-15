const textBoxEditInit = () => {
const textboxes = document.querySelectorAll('.text');
  textboxes.forEach((textbox)=>{
    textbox.addEventListener('click',() => {
      textbox.contentEditable = 'true';
    });
    textbox.addEventListener('blur',() => {
      textbox.contentEditable = 'false';
      const form = event.currentTarget.parentElement;
      // console.log(form);
      const content_text_hidden = form.querySelector('#box_content_text')
      const content_text = form.querySelector('.text').textContent;
      content_text_hidden.value = content_text;
      console.log(content_text_hidden);
      form.submit();
    });
  })
};

export {textBoxEditInit};
