const fullscreenInit = () => {

  const fullscreenButton = document.getElementById('btn_fullscreen');



  if (fullscreenButton) fullscreenButton.addEventListener('click', (event) => {
    console.log("awel");
    document.querySelector(".navbar-wagon").classList.toggle("hidden");
    const newspaperWrapper = document.querySelector(".wrapper");
    if (!document.fullscreenElement) {
      document.documentElement.requestFullscreen();
      fullscreenButton.innerHTML = '<i class="fas fa-compress">';
      newspaperWrapper.classList.toggle("fullscreen");

    } else {
      if (document.exitFullscreen) {
        document.exitFullscreen();
        fullscreenButton.innerHTML = '<i class="fas fa-expand">';
        newspaperWrapper.classList.toggle("fullscreen");

      }
    }
  });
};

export {fullscreenInit};
