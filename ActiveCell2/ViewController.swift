import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let data = ["ピカチュウ","コイキング","ポッポ","ギャラドス","メタモン"]
    
    @IBOutlet weak var tableView:UITableView!
    
    // 戻り用。ストーリーボード上でcontrolを押しながらbackボタンからexitへつなぎ当関数を選択
    @IBAction func back(_ segue:UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // テーブルビューにTableViewCellを登録 これが最初は書かれてなかった。
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil),forCellReuseIdentifier: "MyCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// セルの個数を指定（UITableViewDataSource required）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    /// セルに値を設定（UITableViewDataSource required）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell
        // セルに表示する値を設定する
        //cell.setPokemonName(data[indexPath.row])
        cell.label.text = data[indexPath.row]
        
        return cell
    }
    
    /// セル選択時（UITableViewDataSource optional）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 次の画面へ移動
        performSegue(withIdentifier: "next", sender: data[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! NextViewController
      //  let _ = nextVC.view // ラベルのインスタンス作成のため…ダサいw 他にいい手はないのか.
        
        nextVC.label.text = sender as? String
      
    }
    
}
