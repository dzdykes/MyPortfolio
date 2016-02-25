var intTimer = 0;

function startInterval() {
    intTimer = self.setInterval("showAds()", 5000);
}

function stopInterval() {
    intTimer = self.clearInterval(intTimer);
}

function showAds() {
    var randNum = new Number();
    randNum = Math.floor(Math.random() * 5 + 1);
    document.getElementById("leftAdBanner").src = "images/ads/image" + randNum + ".jpg";
    randNum = Math.floor(Math.random() * 5 + 1);
    document.getElementById("rightAdBanner").src = "images/ads/image" + randNum + ".jpg";

}

function showThankYouWindow() {
    window.open("popups/thankyou.html", "thank you",
        "height= 50, width= 900, screenX= 600, screenY=300, scrollbar=0")
}

function hideGalleryTable()
{
    document.getElementById("galleryTable").style.visibility = "collapse";
}

function showLargeImage(i)
{
    document.getElementById("largeImage").visiblity = "hidden";
    document.getElementById("largeImage").src = "images/larger/image" + i + ".jpg";
}

var price = 100;

function getQuote(addOn)
{
    if (document.getElementById("Buttercream").checked)
    {
        price += 20;
    }
    if (document.getElementById("Fondant").checked)
    {
        price += 120;
    }
    if (document.getElementById("yes").checked)
    {
        price += 100;
    }
    if (document.getElementById("round").checked)
    {
        price += 30;
    }
    if (document.getElementById("p2").selected)
    {
        price += 30;
    }
    if (document.getElementById("p3").selected)
    {
        price += 60;
    }
    if (document.getElementById("p4").selected)
    {
        price += 90;
    }
    document.getElementById("quoteTotal").value = "$" + price;
    price = 100;
}

function showQuote()
{
    window.open("../quote.html", "Quote", "height= 600, width= 1000, screenX= 600, screenY=300, scrollbar=0")
}