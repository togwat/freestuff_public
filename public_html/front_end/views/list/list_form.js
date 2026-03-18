$(function () {
    var uploadedImages = {};
    var imageCounter = 0;   // for ids/keys for uploadedImages dict
    var currentImage;

    var cropper = $('#picture').croppie({
        url: $php.image,
        enableExif: false,
        viewport: {
            width: 260,
            height: 260
        },
        boundary: {
            width: 300,
            height: 300
        },
        enableOrientation: true,

    });

    cropper.croppie('bind', {url: $php.image, zoom: 0});

    function readFile(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#picture').addClass('ready');
                $('#rotate').removeClass('d-none');
                $('#add-picture').removeClass('d-none');
                cropper.croppie('bind', {
                    url: e.target.result,
                    zoom: 0
                });
            };
            reader.readAsDataURL(input.files[0]);
        }
        else {
            alert("Sorry - you're browser doesn't have the required features.");
        }
    }

    $('#upload').on('change', function () {
        readFile(this);
    });

    $('#rotate').on('click', function () {
        cropper.croppie('rotate', -90);
    });

    $('#add-picture').on('click', function() {
        // adds the uploaded picture into a container div below the image editor
        if (!currentImage) return;
        const id = imageCounter++;
        uploadedImages[id] = currentImage;
        
        const img = $('<img>').attr('src', currentImage).css({
            width: '100%',
            height: '100%',
            objectFit: 'cover',
        });
        const removeBtn = $('<i>').addClass('fa fa-times').css({
            position: 'absolute',
            top: '0',
            right: '0',
            margin: '5%',
            width: '1.25em',
            height: '1.25em',
            lineHeight: '1.25em',
            textAlign: 'center'
        });

        const wrapper = $('<div>').addClass('col-4 col-sm-3 col-md-2 p-1').attr('data-id', id).css({
            maxWidth: '80px',
            maxHeight: '80px',
            position: 'relative'
        }).append(img, removeBtn);

        $('#added-picture-container').append(wrapper);

        removeBtn.on('click', function() {
            delete uploadedImages[id];
            wrapper.remove();
        });
    });

    cropper.on('update.croppie', function (ev, cropData) {
        cropper.croppie('result', {type: 'base64', size: {width: 800}, format: 'jpeg'}).then(function (data) {
            currentImage = data;
        });
    });

    function adjustReservedPosition() {
        $('.sold-out-image').each(function () {
            //gets the height of the h4 right above it
            let h4_height = $(this).parent().prev().height() + 25;
            //sets the top position of the sold out to the bottom of the h4
            $(this).css('top', h4_height + 'px');
        });
    }

    // TODO: Remove from code if nothing break [CS] 17/07/2024
    // $('.btn-delist').click(function (e) {
    //     e.preventDefault();
    //
    //     $.ajax({
    //         url: 'list/process_delist/' + $(this).data('listing_id'),
    //     }).done(function (new_status) {
    //         window.location.href = 'my_freestuff#previous';
    //     });
    // });

    $('.btn-submit-form').click(function (e) {
        e.preventDefault();
        $(this).attr('disabled',true);
        $('#list_form').submit();
    });

    $('.btn-cancel-edit').click(function (e) {
        e.preventDefault();
        window.location.href = $(this).data('return')
    });

    $('#list_form').formTools2({
        // upload all images in uploadedImages via input 'image_data'
        onStart: function() {
            // make a new image_data input for every image
            $.each(uploadedImages, function(id, data) {
                $('#list_form').append($('<input>').attr({
                    type: 'hidden',
                    name: 'image_data[]'
                }).val(data));
            });
        },

        successMsg: false,
        onComplete: function (listing_id) {
            $('.btn-submit-form').attr('disabled', false);
        },
        onSuccess: function(listing_id) {
            if ($php.listing_url) {
                document.location = $php.listing_url;
            } else {
                document.location = "list/success/" + listing_id;
            }
        }
    });

    // re-add all existing images during edit mode, if there are any
    if ($php.existing_images) {
        $.each($php.existing_images, function(i, img) {
            currentImage = img;
            $('#add-picture').trigger('click');
        });
    }
    
    $('#list_form #listing_type input').change(function () {
        var val = $(this).val();
        $('.agree').toggleClass('d-none', true);
        $('#agree-' + val).toggleClass('d-none', false);
    });

});
