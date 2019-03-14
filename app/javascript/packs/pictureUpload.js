const pictureUploadInit = () => {

  const uploadButton = document.getElementById("picture_photo");
  if (uploadButton) uploadButton.addEventListener('change', (event) => {
    const form = event.currentTarget.parentElement.parentElement;
    console.log(form);
    form.submit();
  });
};



 export {pictureUploadInit};
