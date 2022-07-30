function item_price (){

  console.log("商品価格を計算");

  const rate = 0.1;
  const item_price = document.getElementById("item-price");

  item_price.addEventListener("keyup", () => {
    console.log(item_price.value)
    const sales_commission = Math.floor(item_price.value * rate);
    sales_commission_St = sales_commission.toLocaleString();
    const sales_profit = item_price.value - sales_commission
    sales_profit_St = sales_profit.toLocaleString();
    const add_tax_Price = document.getElementById("add-tax-price")
    add_tax_Price.innerHTML = `${sales_commission_St}`
    const Profit = document.getElementById("profit")
    Profit.innerHTML = `${sales_profit_St}`

  })


};

window.addEventListener('load', item_price);