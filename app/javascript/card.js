const pay = () => {
   Payjp.setPublicKey("pk_test_f78b79afd6b939978cf5595f"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
       number: formData.get("purchase[number]"),
        cvc: formData.get("purchase[cvc]"),
      exp_month: formData.get("purchase[exp_month]"),
       exp_year: `20${formData.get("purchase[exp_year]")}`,
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
       document.getElementById("card-number").removeAttribute("number");
       document.getElementById("card-cvc").removeAttribute("cvc");
       document.getElementById("card-exp-month").removeAttribute("exp_month");
      document.getElementById("card-exp-year").removeAttribute("exp_year");
  
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);