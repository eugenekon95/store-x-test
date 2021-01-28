document.addEventListener('turbolinks:load', function () {
    if (window.location.pathname.includes("cart")) {
        $(".show-modal").hide();

        function calculatePrice() {
            let totalPrice = 0;
            $('.order-item').each(function () {
                totalPrice += parseFloat($(this).children(".item-price").html()) * parseInt($(this).find(".item-quantity").val())
            });
            $("#total-price").html(`$${totalPrice.toFixed(2)}`);
            return totalPrice.toFixed(2);
        }

        function setQuantitiesArray() {
            let quantitiesArray = [];

            $('.order-item').each(function () {
                quantitiesArray.push(parseInt($(this).find(".item-quantity").val()));
            });
            return quantitiesArray;
        }

        setQuantitiesArray();
        calculatePrice();

        $(".item-quantity").change(function () {
            setQuantitiesArray();
            calculatePrice();
        });

        $("#create-order-button").on("click", function () {
            let totalPrice = calculatePrice();
            let quantitiesArray = setQuantitiesArray();
            let params = {quantities: quantitiesArray, total_price: totalPrice}
            $.ajax({
                url: '/cart',
                type: 'PATCH',
                data: params
            });
            $(".show-modal").click();
        });
    }
});
