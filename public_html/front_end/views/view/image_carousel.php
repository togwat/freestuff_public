<?
$temp_img = new FileHelper('listing_images', $listing->listing_id);
$thumbnail = $temp_img->getImagePathFromTag("most_recent_upload", 600, 600);

$ih = $temp_img->getImageHelperFromTag("most_recent_upload");

$ih->setTargetWidthAndHeight('1200', '1200', 'thumbnail');
$fullsize_img = $temp_img->cacheImageFromImageHelper($ih);

// temp: repeat image 3 times for slider testing
$images = [
    ['thumb' => $thumbnail, 'full' => $fullsize_img],
    ['thumb' => $thumbnail, 'full' => $fullsize_img],
    ['thumb' => $thumbnail, 'full' => $fullsize_img],
];

$slider_id = 'listing-slider-' . $listing->listing_id;
?>

<div id="image_carousel" class="carousel slide mb-3" data-ride="carousel">
    <!--images-->
    <div class="carousel-inner">
        <? foreach ($images as $i => $img): ?>
            <div class="carousel-item <?= ($i === 0 ? 'active' : '') ?>">
                <a href="<?= $img['full'] ?>" target="_blank">
                    <img class="listing_image d-block w-100" src="<?= $img['thumb'] ?>"/>
                </a>
            </div>
        <? endforeach; ?>
    </div>

    <!--one indicator for each image-->
    <ol class="carousel-indicators">
        <? foreach ($images as $i => $img): ?>
            <li data-target="#image_carousel" data-slide-to="<?= $i ?>" <?= ($i === 0 ? 'class="active"' : '') ?>></li>
        <? endforeach; ?>
    </ol>

    <!--side controls-->
    <a class="carousel-control-prev" href="#image_carousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#image_carousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>