(function () {
    'use stict';

    if (!('serviceWorker' in navigator)) {
        console.log('Service worker non supporté');
        return;
    }

    navigator.serviceWorker.register('sw.js')
        .then(() => {
            console.log('Enregistrement OK');
        })
        .catch(error => {
            console.log('Enregistrement KO : ', error);
            console.log(error);
        });

    navigator.serviceWorker.onmessage = function (event) {
        console.log('Reçu du SW : ', event.data);
    };

    if (navigator.serviceWorker.controller) {
        navigator.serviceWorker.controller.postMessage(
            {
                'command': 'MISE_A_JOUR',
                'message': 'Hello je suis un client'
            }
        );
    }

})();
