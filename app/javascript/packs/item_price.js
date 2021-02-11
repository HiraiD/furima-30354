window.addEventListener('load', () => {
  //console.log("ok");
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addTaxDom２  = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  console.log(inputValue);
  addTaxDom.innerHTML = Math.floor(inputValue*0.1);
  addTaxDom２.innerHTML = Math.floor(inputValue*0.9);

  
  });
});