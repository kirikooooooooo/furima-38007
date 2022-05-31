function price(){
  const itemprice = document.getElementById('item-price');
  const addtaxprice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  
  itemprice.addEventListener('input', function(){
    tax = Math.floor(itemprice.value*0.1);
    rieki = Math.floor(itemprice.value-tax);
    addtaxprice.innerHTML = tax;
    profit.innerHTML = rieki;
  })
}

window.addEventListener('load', price);