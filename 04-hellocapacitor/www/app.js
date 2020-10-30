import { Plugins, CameraResultType } from '@capacitor/core';

const { Camera } = Plugins;

async function takePicture() {
    const image = await Camera.getPhoto({
        qualty: 90,
        allowEditing: true,
        resultType: CameraResultType.Uri
    });

    var imageUrl = image.webPath;
    imageElement.src = imageUrl;
}