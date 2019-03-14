const pictureUploadInit = () => {

  const niceUpload = document.getElementById('nice_upload_button');
  const uglyUpload = document.getElementById('ugly_photo_upload');
  if (uglyUpload) uglyUpload.addEventListener('change', (event) => {
    const form = event.currentTarget.parentElement.parentElement;
    console.log(form);
    form.submit();
  });
  if (niceUpload) niceUpload.addEventListener('click', () => {
      uglyUpload.click();
    });
  };

  export {pictureUploadInit};
