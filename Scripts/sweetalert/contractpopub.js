$(document).ready(function () {
    function showModal(modalId, onHiddenCallback) {
        var $modal = $(modalId);

        $modal.off('hidden.bs.modal');
        $modal.on('hidden.bs.modal', function () {
            if (onHiddenCallback) {
                onHiddenCallback();
            }
        });

        $modal.modal('show');
    }

    function hideModal(modalId, onHiddenCallback) {
        var $modal = $(modalId);

        $modal.off('hidden.bs.modal');
        $modal.on('hidden.bs.modal', function () {
            if (onHiddenCallback) {
                onHiddenCallback();
            }
        });

        $modal.modal('hide');
    }

    window.cPopUp = function (options) {
        const {
            messageEn = '',
            messageAr = '',
            confirmCallback = () => { },
            cancelCallback = () => { },
            iconClass = '',
            callbackParams = [],
            title = '',
            YesText = 'Yes',
            NoText = 'No',
            onlyNoBtn = false,
            onlyYesBtn = false,
            TwoBtn = true,
            imgSrc = ''
        } = options;

        // Set messages
        $('#confirmationTextAr').text(messageAr);
        $('#confirmationTextEn').text(messageEn);

        // Show/Hide Image
        if (imgSrc) {
            $('#confirmationImg').attr('src', imgSrc).show();
        } else {
            $('#confirmationImg').hide();
        }

        // Remove all previous click events
        $('#confirmYesBtn').off('click').hide();
        $('#confirmNoBtn').off('click').hide();

        // Set button logic
        if (TwoBtn) {
            $('#confirmYesBtn')
                .show()
                .html('<i class="fa-solid fa-circle-check me-2 fs13"></i>' + YesText)
                .on('click', function () {
                    confirmCallback(...callbackParams);
                    hideModal('#confirmationPopup');
                });

            $('#confirmNoBtn')
                .show()
                .html('<i class="fa-solid fa-circle-xmark me-2 fs13"></i>' + NoText)
                .on('click', function () {
                    cancelCallback();
                    hideModal('#confirmationPopup');
                });
        } else if (onlyNoBtn) {
            $('#confirmNoBtn')
                .show()
                .html('<i class="fa-solid fa-circle-xmark me-2 fs13"></i>' + NoText)
                .on('click', function () {
                    cancelCallback();
                    hideModal('#confirmationPopup');
                });
        } else if (onlyYesBtn) {
            $('#confirmYesBtn')
                .show()
                .html('<i class="fa-solid fa-circle-check me-2 fs13"></i>' + YesText)
                .on('click', function () {
                    confirmCallback(...callbackParams);
                    hideModal('#confirmationPopup');
                });
        }

        // Set icon
        var baseClasses = 'fa-1x';
        if (iconClass) {
            $('#iconConfirmationClass').attr('class', `${iconClass} ${baseClasses}`);
        } else {
            $('#iconConfirmationClass').attr('class', 'fa-solid fa-exclamation ' + baseClasses);
        }

        // Set title
        if (title) {
            $('#confirmationTitle').text(title);
        }

        // Show modal
        showModal('#confirmationPopup');
    };
});