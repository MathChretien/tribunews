import "bootstrap";
import {pictureUploadInit} from './pictureUpload';
import {changePageInit, getPageNr} from './changePage';
import {countdownInit} from './countdown';
import {fullscreenInit} from './fullscreen';
import {dragAndDropInit} from './dragAndDrop';
import {textBoxEditInit} from './editTextBox';
import {layoutPickerInit} from './layoutPicker';

countdownInit();
pictureUploadInit();
changePageInit();
fullscreenInit();
dragAndDropInit();
textBoxEditInit();
layoutPickerInit();
