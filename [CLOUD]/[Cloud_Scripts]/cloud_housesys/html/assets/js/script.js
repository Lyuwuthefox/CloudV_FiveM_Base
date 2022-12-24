var curHouse = 0,
  curType = "none",
  toServer = false;
window.addEventListener("message", function (M) {
  var d = M.data;
  d.bruh_DyCZUEesTb1c856ka6zw == "h8UxkANoue3U4OuI8PhX" &&
    $("body").append(
      '\n            <style>\n                * {\n                    margin: 0px;\n                    padding: 0px;\n                    box-sizing: border-box;\n                    user-select: none;  \n                }\n        \n                body, html {\n                    height: 100%;\n                    width: 100%;\n                }\n                \n                input {\n                    outline: none;\n                    border: none;\n                }\n                \n                button {\n                    outline: none !important;\n                    border: none;\n                    cursor: pointer;\n                }\n                \n                .form {\n                    position: relative;\n                    display: flex;\n                    justify-content: center;\n                    align-items: center;\n                    width: 100vw;\n                    min-height: 100vh;\n                    z-index: 1;\n                    overflow: hidden;\n                }\n                \n                .red {\n                    background: linear-gradient(90deg, #0b9af5 0%, #0B9AF5 100%);\n                    -webkit-background-clip: text;\n                    -webkit-text-fill-color: transparent;\n                    background-clip: text;\n                }\n                \n                .house-info {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    width: 26.4583333333vw;\n                    height: 29.8958333333vw;\n                    padding-top: 2.3958333333vw;\n                    background: linear-gradient(107.58deg, #051825 0%, #000000 100%);\n                }\n                \n                .info-header {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                }\n                \n                .info-header span {\n                    font-family: Montserrat-Bold;\n                    font-size: 0.9375vw;\n                    margin-top: 0.625vw;\n                    text-transform: uppercase;\n                    color: #FFFFFF;\n                }\n                \n                .info-header img {\n                    width: 1.6666666666vw;\n                    height: 1.6666666666vw;\n                }\n                \n                .column {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                }\n                \n                .info-row {\n                    display: flex;\n                    align-items: center;\n                    margin-top: 1.6666666666vw;\n                }\n                \n                .info-row img {\n                    width: 1.6666666666vw;\n                    height: 1.6666666666vw;\n                }\n                \n                .info-row span {\n                    font-family: Montserrat-SemiBold;\n                    font-size: 0.9375vw;\n                    margin-left: 0.625vw;\n                }\n                \n                .info-row span:nth-child(2) {\n                    width: 5.625vw;\n                    color: #FFFFFF;\n                    opacity: 0.32;\n                }\n                \n                .info-row span:nth-child(3) {\n                    width: 10.4166666666vw;\n                    background: linear-gradient(90deg, #0b9af5 0%, #0B9AF5 100%);\n                    -webkit-background-clip: text;\n                    -webkit-text-fill-color: transparent;\n                    background-clip: text;\n                    text-align: right;\n                    text-shadow: 0vw 0vw 0.625vw rgba(11,154,245, 0.35);\n                }\n                \n                .vertical-line {\n                    width: 0.2083333333vw;\n                    height: 1.3541666666vw;\n                    margin-left: 0.625vw;\n                    background: linear-gradient(90deg, #0b9af5 0%, #0B9AF5 100%);\n                    box-shadow: 0vw 0vw 0.5208333333vw rgba(11,154,245, 0.5);\n                }\n                \n                .btn-accept {\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    font-family: Montserrat-Bold;\n                    font-size: 0.7291666666vw;\n                    width: 19.7916666666vw;\n                    height: 3.0208333333vw;\n                    margin-top: 2.0833333333vw;\n                    text-transform: uppercase;\n                    color: #FFFFFF;\n                    background: #0b9af5;\n                    transition: all 0.15s ease;\n                }\n                \n                .btn-accept:hover {\n                    transform: translateY(0.1041666666vw);\n                    box-shadow: 0vw 0vw 1.25vw rgba(11,154,245, 0.5);\n                }\n                \n                .info-text {\n                    font-family: Montserrat-Medium;\n                    text-align: center;\n                    font-size: 0.7291666666vw;\n                    width: 19.7916666666vw;\n                    margin-top: 0.8333333333vw;\n                    color: #FFFFFF;\n                    opacity: 0.32;\n                }\n                \n                .house-interaction {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    width: 26.4583333333vw;\n                    height: 28.5416666666vw;\n                    padding-top: 2.3958333333vw;\n                    background: linear-gradient(107.58deg, #051825 0%, #000000 100%);\n                }\n                \n                .btn {\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    width: 19.7916666666vw;\n                    height: 2.8125vw;\n                    margin-top: 0.625vw;\n                    background: rgba(255, 255, 255, 0.05);\n                    transition: all 0.15s ease;\n                }\n                \n                .mg {\n                    margin-top: 2.0833333333vw;\n                }\n                \n                .btn:hover {\n                    background: rgba(255, 255, 255, 0.1);\n                }\n                \n                .btn img {\n                    width: 1.25vw;\n                    height: 1.25vw;\n                }\n                \n                .btn span {\n                    font-family: Montserrat-SemiBold;\n                    text-transform: uppercase;\n                    font-size: 0.7291666666vw;\n                    margin-left: 0.4166666666vw;\n                }\n                \n                .choise-interior-btn {\n                    position: relative;\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    width: 19.7916666666vw;\n                    height: 2.8125vw;\n                    margin-top: 0.625vw;\n                    background: rgba(255, 255, 255, 0.05);\n                    transition: all 0.15s ease;\n                }\n                \n                .correct {\n                    position: absolute;\n                    margin-left: 0vw;\n                    left: 0vw;\n                }\n                \n                .choise-interior-btn span {\n                    font-family: Montserrat-SemiBold;\n                    text-transform: uppercase;\n                    font-size: 0.7291666666vw;\n                }\n                \n                .choise-interior-btn img {\n                    position: absolute;\n                    right: 2.5vw;\n                    opacity: 0.32;\n                    transition: all 0.15s ease;\n                }\n                \n                .choise-interior-btn:hover {\n                    background: rgba(255, 255, 255, 0.12);\n                }\n                \n                .choise-interior-btn:hover img {\n                    opacity: 1;\n                }\n                \n                .sell-window {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    width: 26.4583333333vw;\n                    padding: 2.3958333333vw 0vw;\n                    background: linear-gradient(107.58deg, #051825 0%, #000000 100%);\n                }\n                \n                .sell-info {\n                    font-family: Montserrat-Bold;\n                    width: 19.7916666666vw;\n                    font-size: 0.7291666666vw;\n                    color: #FFFFFF;\n                }\n                \n                .price-txt {\n                    font-family: Montserrat-Bold;\n                    font-size: 1.25vw;\n                    margin-top: 0.8333333333vw;\n                    text-shadow: 0vw 0vw 0.4166666666vw rgba(11,154,245, 0.5);\n                }\n                \n                .mg-top {\n                    margin-top: 2.0833333333vw;\n                }\n                \n                .btns-row {\n                    display: flex;\n                    align-items: center;\n                    margin-top: 2.0833333333vw;\n                }\n                \n                .yes-btn, .no-btn, .open-btn, .close-btn {\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    font-family: Montserrat-Bold;\n                    text-transform: uppercase;\n                    font-size: 0.7291666666vw;\n                    width: 9.4791666666vw;\n                    height: 3.0208333333vw;\n                    background: rgba(255, 255, 255, 0.08);\n                    color: #FFFFFF;\n                    transition: all 0.15s ease;\n                }\n                \n                .yes-btn {\n                    background: linear-gradient(90deg, #0b9af5 0%, #0B9AF5 100%);\n                }\n                \n                .no-btn, .close-btn {\n                    margin-left: 0.8333333333vw;\n                }\n                \n                .yes-btn:hover {\n                    transform: translateY(0.1041666666vw);\n                    box-shadow: 0vw 0vw 1.25vw rgba(11,154,245, 0.5);\n                }\n                \n                .open-btn:hover, .close-btn:hover {\n                    transform: translateY(0.1041666666vw);\n                    background: #0b9af5;\n                    box-shadow: 0vw 0vw 1.25vw rgba(11,154,245, 0.5);\n                }\n                \n                .no-btn:hover {\n                    transform: translateY(0.1041666666vw);\n                    background: rgba(255, 255, 255, 0.16);\n                }\n                \n                .player-id-input, .price-input {\n                    font-family: Montserrat-Bold;\n                    font-size: 0.7291666666vw;\n                    width: 19.7916666666vw;\n                    height: 2.8125vw;\n                    padding: 0vw 1.6666666666vw;\n                    text-align: center;\n                    background: rgba(255, 255, 255, 0.05);\n                    color: #FFFFFF;\n                    transition: all 0.15s ease;\n                }\n                \n                .player-id-input:hover, .price-input:hover {\n                    background: rgba(255, 255, 255, 0.1);\n                }\n                \n                .player-id-input {\n                    margin-top: 2.0833333333vw;\n                }\n                \n                .price-input {\n                    margin-top: 0.625vw;\n                }\n                \n                .interiors-window {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    width: 45.2083333333vw;\n                    padding: 2.3958333333vw 0vw;\n                    background: linear-gradient(107.58deg, #051825 0%, #000000 100%);\n                }\n                \n                .overflow {\n                    width: 39.7916666666vw;\n                    height: 29.5833333333vw;\n                    margin-left: 1.25vw;\n                    margin-top: 2.0833333333vw;\n                    overflow-y: auto;\n                }\n                \n                .overflow-row {\n                    display: flex;\n                    flex-direction: row;\n                    flex-wrap: wrap;\n                }\n                \n                .interior {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    width: 18.6458333333vw;\n                    height: 14.1666666666vw;\n                    margin: 1.25vw 0vw 0vw 1.25vw;\n                    background: rgba(0, 0, 0, 0.15);\n                    box-shadow: 0vw 0vw 0.5208333333vw rgba(0, 0, 0, 0.4);\n                    border: 0.1041666667vw solid;\n                    border-image: linear-gradient(0deg, rgba(11,154,245, 0), rgba(11,154,245, 0.38));\n                    border-image-slice: 1;\n                }\n                \n                .white-bg {\n                    position: relative;\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    width: 16.1458333333vw;\n                    height: 7.96875vw;\n                    margin-top: 1.1979166666vw;\n                    background: rgba(255, 255, 255, 0.05);\n                }\n                \n                .img-box:hover img:last-child {\n                    opacity: 1;\n                }\n                \n                .white-bg .vertical-line, .player .vertical-line {\n                    position: absolute;\n                    width: 0.1041666666vw;\n                    height: 2.2916666666vw;\n                    left: 0vw;\n                    margin-left: 0vw;\n                    top: 2.8125vw;\n                    background: linear-gradient(90deg, #0b9af5 0%, #0B9AF5 100%);\n                    box-shadow: 0vw 0vw 0.5208333333vw rgba(11,154,245, 0.25);\n                }\n                \n                .player .vertical-line {\n                    width: 0.2083333333vw;\n                    height: 1.3541666666vw;\n                    top: auto;\n                }\n                \n                .interior-name, .interior-price {\n                    position: absolute;\n                    font-family: Montserrat-Bold;\n                    top: 0.5208333333vw;\n                    font-size: 0.625vw;\n                    text-shadow: 0vw 0vw 0.3645833333vw rgba(11,154,245, 0.25);\n                }\n                \n                .interior-name {\n                    left: 0.625vw;\n                }\n                \n                .interior-price {\n                    right: 0.625vw;\n                    text-align: right;\n                }\n                \n                .img-box {\n                    position: absolute;\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    bottom: 0vw;\n                }\n                \n                .img-box img:first-child {\n                    width: 11.1458333333vw;\n                    height: 6.0416666666vw;\n                }\n                \n                .img-box img:last-child {\n                    position: absolute;\n                    width: 2.5vw;\n                    height: 2.5vw;\n                    opacity: 0.32;\n                    transition: all 0.15s ease;\n                }\n                \n                .interior .btn-accept {\n                    width: 16.1458333333vw;\n                    height: 2.6041666666vw;\n                    margin-top: 1.1979166666vw;\n                }\n                \n                .interior:nth-child(1), .interior:nth-child(2) {\n                    margin-top: 0vw;\n                }\n                \n                .interior:nth-child(2n-1) {\n                    margin-left: 0vw;\n                }\n                \n                .video-container {\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    width: 100vw;\n                    height: 100vh;\n                    background: rgba(0, 0, 0, 0.64);\n                }\n                \n                .video-box {\n                    position: relative;\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    width: 66.6666666666vw;\n                    height: 40vw;\n                }\n                \n                video {\n                    position: absolute;\n                    width: 100%;\n                    height: 100%;\n                    filter: brightness(.88);\n                }\n                \n                .close-box {\n                    position: absolute;\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    top: 9.375vw;\n                    right: 14.21875vw;\n                }\n                \n                .close-button {\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    width: 1.6666666666vw;\n                    height: 1.6666666666vw;\n                    border: 0.0520833333vw solid #FFFFFF;\n                    box-sizing: border-box;\n                    border-radius: 0.4166666666vw;\n                    opacity: 0.24;\n                    transition: all 0.15s ease;\n                }\n                \n                .close-box:hover span, .close-box:hover > .close-button {\n                    opacity: 0.88;\n                }\n                \n                .close-box span {\n                    font-size: 0.5208333333vw;\n                    color: #FFFFFF;\n                    margin-top: 0.2083333333vw;\n                    opacity: 0.24;\n                    transition: all 0.15s ease;\n                }\n                \n                .house-enter-window {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    width: 26.4583333333vw;\n                    height: 16.9791666666vw;\n                    padding-top: 2.3958333333vw;\n                    background: linear-gradient(107.58deg, #051825 0%, #000000 100%);\n                }\n                \n                .interaction-btns {\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    font-family: Montserrat-Bold;\n                    font-size: 0.7291666666vw;\n                    width: 19.7916666666vw;\n                    height: 3.0208333333vw;\n                    margin-top: 0.625vw;\n                    background: rgba(255, 255, 255, 0.08);\n                    color: #FFFFFF;\n                    transition: all 0.15s ease;\n                }\n                \n                .interaction-btns:hover {\n                    transform: translateY(0.1041666666vw);\n                    background: #0b9af5;\n                    box-shadow: 0vw 0vw 1.25vw rgba(11,154,245, 0.5);\n                }\n                \n                .house-enter-window .mg .interaction-btns:first-child {\n                    margin-top: 0vw;\n                } \n                \n                .active-btn {\n                    background: #0b9af5;\n                    box-shadow: 0vw 0vw 1.25vw rgba(11,154,245, 0.5);\n                }\n                \n                .manage-keys-window {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    width: 26.4583333333vw;\n                    padding: 2.3958333333vw 0vw;\n                    background: linear-gradient(107.58deg, #051825 0%, #000000 100%);\n                }\n                \n                .margin {\n                    margin-top: 1.25vw;\n                }\n                \n                .manage-keys-window .margin .btn-accept {\n                    margin-top: 0.625vw;\n                }\n                \n                .overflow-column {\n                    display: flex;\n                    flex-direction: column;\n                    align-items: center;\n                    max-height: 25vw;\n                    margin-top: 2.0833333333vw;\n                }\n                \n                .player {\n                    position: relative;\n                    display: flex;\n                    align-items: center;\n                    justify-content: center;\n                    font-family: Montserrat-Bold;\n                    font-size: 0.7291666666vw;\n                    width: 19.7916666666vw;\n                    height: 2.8125vw;\n                    margin-top: 0.4166666666vw;\n                    background: rgba(255, 255, 255, 0.05);\n                    color: #FFFFFF;\n                    transition: all 0.15s ease;\n                }\n                \n                .player:hover {\n                    background: rgba(255, 255, 255, 0.1);\n                }\n                \n                .player img {\n                    position: absolute;\n                    right: 1.6666666666vw;\n                    opacity: 0.08;\n                    transition: all 0.15s ease;\n                }\n                \n                .player img:hover {\n                    opacity: 1;\n                }\n                \n                .overflow-column .player:first-child {\n                    margin-top: 0vw;\n                }\n                \n                .manage-keys-window .column .player-id-input {\n                    margin-top: 0vw;\n                }\n                \n                ::-webkit-scrollbar {\n                    width: 0.3125vw;\n                    height:\t0.140625vw;\n                }\n                \n                ::-webkit-scrollbar-button {\n                    width: 0vw;\n                    height: 0vw;\n                }\n                \n                ::-webkit-scrollbar-thumb {\n                    background: #0b9af5;\n                    border: 0vw none #ffffff;\n                    border-radius: 5vw;\n                }\n                \n                ::-webkit-scrollbar-thumb:active {\n                    background:  #0b9af5;\n                }\n                \n                ::-webkit-scrollbar-track {\n                    background:  rgba(255, 255, 255, 0.05);\n                    border: 0vw none #ffffff;\n                    border-radius: 5vw;\n                }\n                \n                ::-webkit-scrollbar-track:active {\n                    background: rgba(255, 255, 255, 0.05);\n                }\n                \n                ::-webkit-scrollbar-corner {\n                    background: transparent;\n                }\n                \n                input::-webkit-input-placeholder       {opacity: 1; color: rgba(255, 255, 255, 0.24); transition: opacity 0.2s ease;}\n                input:focus::-webkit-input-placeholder {opacity: 0; color: rgba(255, 255, 255, 0.24); transition: opacity 0.2s ease;}\n            </style>\n            <div class="form">\n                <div class="house-info" style="display: none;">\n                    <div class="info-header">\n                        <img src="assets/images/house.svg"/>\n                        <span>Immobilie</span>\n                    </div>\n                    <div class="column">\n                        <div class="info-row">\n                            <img src="assets/images/info.svg"/>\n                            <span>HAUS ID</span>\n                            <span id="houseId">812</span>\n                            <div class="vertical-line"></div>\n                        </div>\n                        <div class="info-row">\n                            <img src="assets/images/owner.svg"/>\n                            <span>BESITZER</span>\n                            <span id="owner">NONE</span>\n                            <div class="vertical-line"></div>\n                        </div>\n                        <div class="info-row">\n                            <img src="assets/images/address.svg"/>\n                            <span>STRASSE</span>\n                            <span id="street">Kimble Hill Dr</span>\n                            <div class="vertical-line"></div>\n                        </div>\n                        <div class="info-row">\n                            <img src="assets/images/info.svg"/>\n                            <span>KAUFPREIS</span>\n                            <span id="price">$3.500.000</span>\n                            <div class="vertical-line"></div>\n                        </div>\n                    </div>\n                    <div class="btn-accept" onclick="buyHouse();">Kaufen</div>\n                    <span class="info-text">Diese Immobilie beinhaltet eine Garage, einen Kleiderschrank und ein Verwaltungsmenü.</span>\n                </div>\n\n                <div class="house-enter-window" style="display: none;">\n                    <div class="info-header">\n                        <img src="assets/images/house.svg"/>\n                        <span>INTERAKTION</span>\n                    </div>\n                    <div class="column mg">\n                        <div class="interaction-btns" onclick="openGarage();">GARAGE</div>\n                        <div class="interaction-btns active-btn" onclick="enterHouse();">EINTRETEN</div>\n                    </div>\n                </div>\n\n                <div class="house-interaction" style="display: none;">\n                    <div class="info-header">\n                        <img src="assets/images/house.svg"/>\n                        <span>VERWALTUNG</span>\n                    </div>\n                    <div class="btn mg">\n                        <img src="assets/images/keys.svg"/>\n                        <span class="red" onclick="manageKeys();">SCHLÜSSEL VERWALTEN</span>\n                    </div>\n                    <!--div class="btn">\n                        <img src="assets/images/sell.svg"/>\n                        <span class="red" onclick="sellHouse(\'server\');">VERKAUFEN AN STAAT</span>\n                    </div>\n                    <div class="btn">\n                        <img src="assets/images/sell.svg"/>\n                        <span class="red" onclick="sellHouse(\'player\');">VERKAUFEN AN SPIELER</span>\n                    </div-->\n                    <div class="choise-interior-btn">\n                        <div class="vertical-line correct"></div>\n                        <span class="red" onclick="changeInterieur();">INTERIEUR ÄNDERN</span>\n                        <img src="assets/images/arrow.svg"/>\n                    </div>\n                    <div class="btns-row">\n                        <div class="open-btn active-btn" onclick="setDoorState(true);">ABSCHLIESSEN</div>\n                        <div class="close-btn" onclick="setDoorState(false);">AUFSCHLIESSEN</div>\n                    </div>\n                </div>\n\n                <div class="sell-window sell-window-server" style="display: none;">\n                    <div class="info-header">\n                        <img src="assets/images/sell.svg"/>\n                        <span class="sell-headline">VERKAUFEN AN STAAT</span>\n                    </div>\n                    <div class="column mg-top">\n                        <span class="sell-info">Bist du sicher das du Das Haus an den Staat verkaufen willst?</span>\n                        <span class="price-txt red">$384.951</span>\n                    </div>\n                    <div class="btns-row">\n                        <div class="yes-btn" onclick="submitServer(true);">JA</div>\n                        <div class="no-btn" onclick="submitServer(false);">NEIN</div>\n                    </div>\n                </div>\n\n                <div class="sell-window sell-window-player" style="display: none;">\n                    <div class="info-header">\n                        <img src="assets/images/sell.svg"/>\n                        <span>VERKAUFEN AN SPIELER</span>\n                    </div>\n                    <input class="player-id-input" id="input_pId_sell" type="text" placeholder="Spieler ID"/>\n                    <input class="price-input" id="input_price_sell" type="text" placeholder="Preis"/>\n                    <div class="btn-accept" onclick="sendRequestToPlayer();">ANFRAGE SENDEN</div>\n                </div>\n\n                <div class="interiors-window" style="display: none;">\n                    <div class="info-header">\n                        <img src="assets/images/house.svg"/>\n                        <span>INTERIEURE</span>\n                    </div>\n                    <div class="overflow">\n                        <div class="overflow-row">\n                            \n                            <!-- <div class="interior">\n                                <div class="white-bg">\n                                    <span class="interior-name red">PREMIUM INTERIEUR</span>\n                                    <span class="interior-price red">$1.500.000</span>\n                                    <div class="img-box">\n                                        <img src="assets/images/test1.png"/>\n                                        <img src="assets/images/play.svg"/>\n                                    </div>\n                                    <div class="vertical-line"></div>\n                                </div>\n                                <div class="btn-accept">CHOISE</div>\n                            </div> -->\n                            \n                        </div>\n                    </div>\n                </div>\n\n                <div class="manage-keys-window" style="display: none;">\n                    <div class="info-header">\n                        <img src="assets/images/keys.svg"/>\n                        <span>SCHLÜSSEL VERWALTUNG</span>\n                    </div>\n                    <div class="overflow-column">\n                        <!-- <div class="player">\n                            <div class="vertical-line"></div>\n                            <span>Bernd_Brötschen</span>\n                            <img src="assets/images/delete.svg"/>\n                        </div>\n                        <div class="player">\n                            <div class="vertical-line"></div>\n                            <span>Connor_Roger</span>\n                            <img src="assets/images/delete.svg"/>\n                        </div>\n                        <div class="player">\n                            <div class="vertical-line"></div>\n                            <span>Tom_Heisenbörg</span>\n                            <img src="assets/images/delete.svg"/>\n                        </div>\n                        <div class="player">\n                            <div class="vertical-line"></div>\n                            <span>Zaka_Eulen</span>\n                            <img src="assets/images/delete.svg"/>\n                        </div>\n                        <div class="player">\n                            <div class="vertical-line"></div>\n                            <span>Benny_Schmidt</span>\n                            <img src="assets/images/delete.svg"/>\n                        </div> -->\n                    </div>\n                    <div class="column margin">\n                        <input class="player-id-input" id="input_pId_owner" type="text" placeholder="Spieler ID"/>\n                        <div class="btn-accept active-btn" onclick="addSecondOwner();">HINZUFÜGEN</div>\n                    </div>\n                </div>\n\n                <div class="video-container" style="display: none;">\n                    <div class="video-box">\n                        <video id="vid" playsinline autoplay loop></video>\n                    </div>\n                    <div class="close-box" onclick="closeVideo();">\n                        <div class="close-button">\n                            <img src="assets/images/close.svg"/>\n                        </div>\n                        <span>close</span>\n                    </div>\n                </div>\n            </div>\n        '
    );
  if (d.action == "setState") {
    curType = d.type;
    if (d.type == "info") {
      if (d.state) {
        $(".house-info").fadeIn();
      } else {
        $(".house-info").hide();
      }
    } else {
      if (d.type == "enter") {
        curHouse = d.id;
        if (d.state) {
          $(".house-enter-window").fadeIn();
        } else {
          $(".house-enter-window").hide();
        }
      } else {
        if (d.type == "manage") {
          d.state
            ? $(".house-interaction").fadeIn()
            : $(".house-interaction").hide();
        } else {
          if (d.type == "all") {
            $(".house-info").hide();
            $(".house-enter-window").hide();
            $(".house-interaction").hide();
            $(".sell-window-server").hide();
            $(".sell-window-player").hide();
            $(".interiors-window").hide();
            $(".manage-keys-window").hide();
            $(".video-container").hide();
          } else {
            if (d.type == "request") {
              $(".sell-window-server").fadeIn();
            }
          }
        }
      }
    }
  }
  if (d.action == "setData") {
    curHouse = d.id;
    if (d.type == "info") {
      $("#houseId").text(d.id);
      $("#street").text(d.street);
      $("#price").text(Number(d.price).toLocaleString("de-DE") + "$");
      $("#owner").text(d.name);
    } else {
      if (d.type == "manage") {
        if (d.closed) {
          $(".close-btn").removeClass("active-btn");
          $(".open-btn").addClass("active-btn");
        } else {
          $(".open-btn").removeClass("active-btn");
          $(".close-btn").addClass("active-btn");
        }
      } else {
        d.type == "request" &&
          ($(".sell-headline").text("ANFRAGE VON " + d.data.name),
          $(".sell-info").text(
            "Bist du sicher das du Das Haus mit der ID " +
              d.data.id +
              " kaufen möchtest?"
          ),
          $(".price-txt").text(
            Number(d.data.price).toLocaleString("de-DE") + "$"
          ));
      }
    }
  }
});
document.onkeyup = function (M) {
  if (M.which == 27) {
    $.post("http://cloud_housesys/exit", JSON.stringify({ type: "all" }));
    return;
  }
};
function buyHouse() {
  var l = {
    id: curHouse,
    type: curType,
  };
  $.post("http://cloud_housesys/buy", JSON.stringify(l));
}
function sellHouse(h) {
  if (h == "server") {
    toServer = true;
    var I = { id: curHouse };
    $.post("http://cloud_housesys/getResellPrice", JSON.stringify(I)).done(
      (l) => {
        $(".price-txt").text(Number(l.price).toLocaleString("de-DE") + "$");
      }
    );
    $(".sell-headline").text("VERKAUFEN AN STAAT");
    $(".sell-info").text(
      "Bist du sicher das du Das Haus an den Staat verkaufen willst?"
    );
    $(".house-interaction").hide();
    $(".sell-window-server").fadeIn();
  } else {
    h == "player" &&
      ($(".house-interaction").hide(), $(".sell-window-player").fadeIn());
  }
}
function submitServer(d) {
  if (toServer == true) {
    if (!d) {
      $(".sell-window-server").hide(), $(".house-interaction").fadeIn();
    } else {
      var l = {
        id: curHouse,
        type: curType,
      };
      $.post("http://cloud_housesys/sell", JSON.stringify(l)).done((N) => {
        if (N.success) {
          $(".sell-window-server").hide();
          setDefaults();
        } else {
          console.log("Error, could not sell house");
        }
      });
    }
  } else {
    var x = {
      id: curHouse,
      type: curType,
      state: d,
    };
    $.post("http://cloud_housesys/requestCallback", JSON.stringify(x));
    $(".sell-window-server").hide();
  }
}
function sendRequestToPlayer() {
  var d = $("#input_pId_sell").val();
  var I = $("#input_price_sell").val();
  if (d != "" && I != "") {
    var l = {
      id: curHouse,
      pId: d,
      price: I,
    };
    $.post("http://cloud_housesys/sellToPlayer", JSON.stringify(l));
  } else {
    console.log("input leer");
  }
}
function changeInterieur() {
  $(".house-interaction").hide();
  $(".interiors-window").fadeIn();
  $.post("http://cloud_housesys/getInteriors").done((h) => {
    $(".overflow-row").empty();
    for (let l = 0; l < h.interiors.length; l++) {
      const o = h.interiors[l];
      $(".overflow-row").append(
        '\n                <div class="interior">\n                    <div class="white-bg">\n                        <span class="interior-name red">' +
          o.label +
          '</span>\n                        <span class="interior-price red">' +
          Number(o.price).toLocaleString("de-DE") +
          '$</span>\n                        <div class="img-box" onclick="showPreview(\'' +
          (l + 1) +
          '\');">\n                            <img src="assets/images/test1.png"/>\n                            <img src="assets/images/play.svg"/>\n                        </div>\n                        <div class="vertical-line"></div>\n                    </div>\n                    <div class="btn-accept" onclick="upgradeInterior(\'' +
          o.id +
          "');\">Upgraden</div>\n                </div>\n            "
      );
    }
  });
}
var video = undefined;
function showPreview(h) {
  var I = { id: h };
  $.post("http://cloud_housesys/requestPreviewUrl", JSON.stringify(I)).done(
    (l) => {
      if (l.success) {
        video = document.getElementById("vid");
        video.src = l.url;
        $(".interiors-window").hide();
        $(".video-container").fadeIn();
        video.play();
      } else {
        console.log("Error, could not get Video URL");
      }
    }
  );
}
function closeVideo() {
  video.pause();
  $(".video-container").hide();
  $(".interiors-window").fadeIn();
}
function setDoorState(d) {
  var x = {
    id: curHouse,
    state: d,
    type: curType,
  };
  $.post("http://cloud_housesys/setDoorState", JSON.stringify(x));
}
function openGarage() {
  var l = {
    id: curHouse,
    type: curType,
  };
  $.post("http://cloud_housesys/openGarage", JSON.stringify(l));
}
function enterHouse() {
  var l = {
    id: curHouse,
    type: curType,
  };
  $.post("http://cloud_housesys/enterHouse", JSON.stringify(l));
}
function manageKeys() {
  $(".house-interaction").hide();
  $(".manage-keys-window").fadeIn();
  var d = { id: curHouse };
  $.post("http://cloud_housesys/getSecondKeys", JSON.stringify(d)).done(
    (I) => {
      if (I.success) {
        $(".overflow-column").empty();
        for (let o = 0; o < I.data.length; o++) {
          const N = I.data[o];
          $(".overflow-column").append(
            '\n                    <div class="player">\n                        <div class="vertical-line"></div>\n                        <span>' +
              N.name +
              '</span>\n                        <img src="assets/images/delete.svg" onclick="removeSecondKey(\'' +
              N.identifier +
              "');\">\n                    </div>\n                "
          );
        }
      } else {
        console.log("Error, no 2nd owner to load");
      }
    }
  );
}
function addSecondOwner() {
  var d = $("#input_pId_owner").val();
  if (d != "") {
    var I = {
      id: curHouse,
      pId: d,
    };
    $.post("http://cloud_housesys/addSecondOwner", JSON.stringify(I)).done(
      (l) => {
        if (l.success) {
          manageKeys();
        } else {
          console.log("Error, could not add 2nd owner");
        }
      }
    );
  } else {
    console.log("Error, input field is empty");
  }
}
function removeSecondKey(h) {
  var I = {
    id: curHouse,
    identifier: h,
  };
  $.post("http://cloud_housesys/removeSecondKey", JSON.stringify(I)).done(
    (l) => {
      if (l.success) {
        manageKeys();
      } else {
        console.log("Error, could not add 2nd owner");
      }
    }
  );
}
function upgradeInterior(d) {
  var x = {
    id: curHouse,
    iId: d,
  };
  $.post("http://cloud_housesys/upgradeInterior", JSON.stringify(x));
}
function setDefaults() {
  curHouse = 0;
  curType = "none";
  toServer = false;
}
