function charge (){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");
  // if(document.URL.match(/new/))
  {
  itemPrice.addEventListener('keyup', () => {
    const Value = itemPrice.value;
    const chargeTax = Math.floor(Value * 0.1);
    const chargeProfit = Math.floor(Value * 0.9);
    addTaxPrice.innerHTML = `${chargeTax.toLocaleString()}`;
    Profit.innerHTML = `${chargeProfit.toLocaleString()}`;
  });}
}
window.addEventListener('load', charge);
