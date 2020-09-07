const pay = () => {
  Payjp.setPublicKey("pk_test_195627ccf4ab294cce8cff2f"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");//charge-form内のsubmitの実行
  form.addEventListener("submit", (e) => {
    e.preventDefault(); //railsではなく、JSでサーバーサイドに送るためにフォームの送信キャンセル
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`, //カード情報を変数に
    };
    Payjp.createToken(card, (status, response) => { //PAY.JPにアクセス
      if (status == 200) { //ステータス200でトークンの生成が成功であればif内のコードを実行
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;//コントローラーに受け渡しているname
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");//情報の削除
 
      document.getElementById("charge-form").submit();//サーバーサイドに送信
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);