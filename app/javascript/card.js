const pay = () => {
  const Payjp_pk = process.env.PAYJP_PUBLIC_KEY
  Payjp.setPublicKey(Payjp_pk);  // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");//charge-form内のsubmitの実行
  form.addEventListener("submit", (e) => {
    e.preventDefault(); //railsではなく、JSでサーバーサイドに送るためにフォームの送信キャンセル
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("item_purchase[number]"),
      cvc: formData.get("item_purchase[cvc]"),
      exp_month: formData.get("item_purchase[exp_month]"),
      exp_year: `20${formData.get("item_purchase[exp_year]")}`, //カード情報を変数に
    };
    Payjp.createToken(card, (status, response) => { //PAY.JPにアクセス
      if (status == 200) { //ステータス200でトークンの生成が成功であればif内のコードを実行
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='item_purchase[token]'>`;//コントローラーに受け渡しているname
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");//情報の削除
 
      document.getElementById("charge-form").submit();//サーバーサイドに送信
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);