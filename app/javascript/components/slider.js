import 'ion-rangeslider'

const initSlider = () => {
    $(".js-range-slider").ionRangeSlider({
        type: "double",
        grid: true,
        values: ["6:00","7:00","8:00","9:00", "10:00", "11:00",
                "12:00", "13:00", "14:00", "15:00", "16:00", "17:00",
                "18:00", "19:00"]
        });
  }

export {initSlider}
