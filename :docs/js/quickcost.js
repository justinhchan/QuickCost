$("#calculateButton").on("click", function() {
    var itemPrice = parseFloat(document.getElementById("inputPrice").value);
    var percentage = parseFloat(document.getElementById("inputPercentage").value) ? parseFloat(document.getElementById("inputPercentage").value) : 0;

    var finalCost = itemPrice - (itemPrice * (percentage * .01));
    if (Number.isFinite(finalCost)) {
        $("#dicountPriceOutput").text(finalCost.toFixed(2));
    }
});