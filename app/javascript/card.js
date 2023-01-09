const pay = () => {
  //環境変数をもとに公開鍵を復号
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY)
  //elementsインスタンスを生成
  const elements = payjp.elements();

  //入力欄ごとにelementインスタンスを生成
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  //入力欄をDOM上に表示
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  //フォームの要素を取得
  const submit = document.getElementById("button");

  //PAY.JPと通信が成功した場合のみトークンをフォームに埋め込む
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("charge-form").submit();
    });
  })
}

window.addEventListener("load", pay);