const pictureUploadInit = () => {

  const uploadButton = document.getElementById("picture_photo");
  uploadButton.addEventListener('change', (event) => {
    const form = event.currentTarget.parentElement.parentElement;
    console.log(form);
    form.submit();
    console.log('yeah');
  });
};



 export {pictureUploadInit};