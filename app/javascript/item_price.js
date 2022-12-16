window.addEventListener('load', () => {
  const priceInput  = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const taxValue = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = taxValue;
    const ProfitDom = document.getElementById("profit");
    const ProfitValue = inputValue - taxValue;
    ProfitDom.innerHTML = ProfitValue;
  })
});