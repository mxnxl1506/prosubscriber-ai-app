import React from "react";

import { AppImages } from "../src/utils/AppImages";

const fetchLogo = (serviceName) => {
    const appImageMap = {
        'Anghami': AppImages.Anghami,
        'Careem': AppImages.Careem,
        'Crunchyroll': AppImages.Crunchyroll,
        'Deezer': AppImages.Deezer,
        'Deliveroo': AppImages.Deliveroo,
        'Disney+': AppImages.DisneyPlus,
        'Hungama': AppImages.Hungama,
        'Netflix': AppImages.Netflix,
        'OSN+': AppImages.OSNPlus,
        'Rakuten Viki': AppImages.RakutenViki,
        'Talabat': AppImages.Talabat,
        'Viu': AppImages.Viu,
        'Youtube Music': AppImages.YoutubeMusic,
    };

    const imagePath = appImageMap[serviceName] || null;

    return imagePath;
}

export default fetchLogo;
