function tax() {
  const price_tax = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const price_profit = document.getElementById("profit");
  price_tax.addEventListener('keyup', function(){
    const price = this.value;
    if(300 <= price && price <= 9999999) {
    const fee = Math.floor(price / 10);
    const profit = (price - fee);
    tax.innerHTML = fee;
    price_profit.innerHTML = profit;
    }else{
    tax.innerHTML = '';
    price_profit.innerHTML = '';
    }
  })
};
window.addEventListener('load', tax);